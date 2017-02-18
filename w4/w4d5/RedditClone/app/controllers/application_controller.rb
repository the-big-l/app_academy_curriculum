class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :require_login, only: [:new, :edit, :create, :destroy]

  helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login!(user)
    user.reset_session_token!
    session[:session_token] = user.session_token
  end

  def logged_in?
    !current_user.nil?
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
    # fail
  end

  private

  def require_login
    unless logged_in?
      flash[:errors] = ["You need to be logged in to do what you were trying to do bruh..."]
      redirect_to new_session_url
    end
  end
end
