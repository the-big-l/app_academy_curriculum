class SessionsController < ApplicationController
  def new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
      )

    if @user
      login_user!(@user)
      redirect_to bands_url, notice: 'User was successfully logged in.'
    else
      flash.now[:notice] = 'incorrect login info'
      render :new
    end
  end

  def destroy
    logout_user!
    redirect_to new_session_url, notice: 'User was successfully logged out.'
  end
end
