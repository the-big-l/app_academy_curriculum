class SessionsController < ApplicationController

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
    redirect_to links_url, notice: 'User was successfully logged in.'
    else
      render :new
    end
    end
  end
end
