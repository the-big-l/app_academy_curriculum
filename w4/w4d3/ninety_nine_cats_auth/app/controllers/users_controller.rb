class UsersController < ApplicationController
  before_action :go_to_cats

  def go_to_cats
    redirect_to cats_url if current_user
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #don't have show
      login!(@user)
      redirect_to cats_url
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_url
    end
  end

  def user_params
    params.require(:user).permit(:user_name, :password)
  end
end
