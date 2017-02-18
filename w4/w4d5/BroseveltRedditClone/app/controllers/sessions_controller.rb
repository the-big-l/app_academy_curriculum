class SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    if @user
      login!(@user)
      redirect_to links_url
    else
      flash.now[:errors] = "Sorry brosevelt, invalid credentials."
      render :new
    end
  end

  def new
  end

  def destroy
  end
end
