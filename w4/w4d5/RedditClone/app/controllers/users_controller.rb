class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
    render 'users/new_user'
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to subs_url
      # redirect_to new_users_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new_user
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
