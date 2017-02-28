class GoalsController < ApplicationController
  def new
    @goal = Goal.new
  end

  def edit
  end

  def index
    @goals = current_user.goals
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def create
    @goal = current_user.goals.new(goal_params)

    if @goal.save
      redirect_to goals_url
    else
      flash[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def goal_params
    req = params.require(:goal).permit(:body, :title, private: [])
    req[:private] = req[:private].include?('true') ? 'true' : 'false'
    req[:completed] = 'false'
    req
  end
end
