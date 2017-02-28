class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_credentials(user_params)

    if @user
      login!(@user)
    else
      flash[:errors] = ['bad credentials']
      render :new
    end
  end

  def destroy
    logout!
  end
end
