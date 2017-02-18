class SubsController < ApplicationController
  def new
    @sub = Sub.new
    render :new
  end

  def index
    @subs = Sub.all
  end

  def show
    @sub = Sub.find(params[:id])
  end

  def create
    @sub_reddit = Sub.new(sub_params)
    @sub_reddit.moderator_id = current_user.id
    if @sub_reddit.save
      redirect_to sub_url(@sub_reddit)
    else
      flash.now[:errors] = @sub_reddit.errors.full_messages
      render :new
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description)
  end
end
