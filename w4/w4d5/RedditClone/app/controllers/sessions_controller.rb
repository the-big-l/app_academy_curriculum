class SessionsController < ApplicationController

  skip_before_action :require_login, only: [:new, :create]

  def new
    render 'sessions/login_page'
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      login!(@user)
      redirect_to subs_url
    else
      flash.now[:errors] = ["Incorrect login credentials"]
      render :new
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

end
