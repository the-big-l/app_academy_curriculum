# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string
#  session_token   :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  attr_reader :password

  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_token

  has_many :authored_comments,
    foreign_key: :author_id,
    class_name: 'Comment'

  has_many :comments_on_profile, as: :commenticity

  has_many :cheers
  has_many :goals

  def self.generate_token
    SecureRandom.urlsafe_base64
  end

  def self.find_by_credentials(credentials)
    user = User.find_by_username(credentials[:username])
    return nil unless user
    user.valid_password?(credentials[:password]) ? user : nil
  end

  def password=(pwd)
    @password = pwd
    self.password_digest = BCrypt::Password.create(pwd)
  end

  def ensure_token
    self.session_token ||= self.class.generate_token
  end

  def reset_token!
    self.session_token = self.class.generate_token
    self.save
    self.session_token
  end

  def valid_password?(pwd)
    BCrypt::Password.new(self.password_digest).is_password?(pwd)
  end
end
