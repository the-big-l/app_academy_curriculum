# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  validates :user_name, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "Password can't be blank" }
  validates :password, length:{ minimum: 6, allow_nil: true }

  attr_reader :password

  has_many :cats

  has_many :cat_rental_requests


  after_initialize :create_session

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(user_name, password)
    user = User.find_by(user_name: user_name)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
    @password = password
  end

  private
  def create_session
    self.session_token = self.class.generate_session_token
    device = browser.device
    Session.create(session_token: self.session_token, user_id: self.id, device: device)
  end

end
