class User < ActiveRecord::Base
  attr_reader :password

  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return nil unless user
    user.valid_password?(password) ? user : nil
  end

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save
    self.session_token
  end

  def valid_password?(pwd)
    BCrypt::Password.new(self.password_digest).is_password?(pwd)
  end

  def password=(pwd)
    @password = pwd
    self.password_digest = BCrypt::Password.create(pwd)
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end
end
