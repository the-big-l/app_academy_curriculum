class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?

  def login!(user)
    session[:session_token] = user.reset_token!
    redirect_to goals_url
  end

  def logged_in?
    !!current_user
  end

  def current_user
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logout!
    current_user.reset_token!
    session[:session_token] = nil
    redirect_to new_session_url
  end

  def require_login
    unless current_user
      redirect_to new_session_url
    end
  end

    def user_params
      params.require(:user).permit(:username, :password)
    end
end
