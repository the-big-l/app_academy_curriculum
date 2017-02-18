class SessionsController < ApplicationController
  before_action :go_to_cats, only: [:new, :create]

  def go_to_cats
    redirect_to cats_url if current_user
  end

  def new

    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:user_name],
                                     params[:user][:password])
    if user
      login!(user)
    else
      redirect_to new_session_url
    end
  end

  def destroy
    current_user.reset_session_token! if current_user
    session[:session_token] = nil
    redirect_to new_session_url
  end

end
