class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      session_params[:username],
      session_params[:password]
    )

    if @user
      session[:session_token] = @user.session_token
      redirect_to links_url, notice: 'User was successfully logged in.'
    else
      flash[:errors] = ['incorrect credentials']
      render :new
    end
  end

  def session_params
    params.require(:user).permit(:username, :password)
  end
end
