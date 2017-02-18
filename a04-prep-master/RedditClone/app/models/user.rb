# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  email           :string           not null
#  username        :string           not null
#  session_token   :string           not null
#  password_digest :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ActiveRecord::Base
  attr_reader :password

  validates :email, presence: true
  validates :username, :session_token, :password_digest,
    presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  def self.find_by_credentials(un, pwd)
    user = User.find_by_username(un)
    return nil unless user
    user.valid_password?(pwd) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def password=(pwd)
    @password = pwd
    self.password_digest = BCrypt::Password.create(pwd)
  end

  private

  def valid_password?(pwd)
    BCrypt::Password.new(self.password_digest).is_password?(pwd)
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
