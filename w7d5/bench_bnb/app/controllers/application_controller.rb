class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user, :logged_in?

  def login!(user)
    @current_user = user
    session[:session_token] = user.reset_token!
  end

  def logout!
    current_user.reset_token!
    session[:session_token] = nil
    @current_user = nil
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    !current_user.nil?
  end

  def require_login
    render json: {base: ['invalid credentials']}, status: 401 unless current_user
  end
end