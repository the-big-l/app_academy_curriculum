class UsersController < ApplicationController
  before_action :require_login!, only: [:show, :update]

  def show
    @user = User.find(params[:id])
    render :show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      login_user!(@user)
      redirect_to @user, notice: 'User was successfully created.'
    else
      flash.now[:notice] = @user.errors.full_messages
      render :new
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      flash.now[:notice] = @user.errors.full_messages
      render :edit
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
