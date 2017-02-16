class SubredditsController < ApplicationController
  before_action :set_subreddit, only: [:show, :edit, :update, :destroy]

  # GET /subreddits
  def index
    @subreddits = Subreddit.all
  end

  # GET /subreddits/1
  def show
  end

  # GET /subreddits/new
  def new
    @subreddit = Subreddit.new
  end

  # GET /subreddits/1/edit
  def edit
  end

  # POST /subreddits
  def create
    @subreddit = Subreddit.new(subreddit_params)

    if @subreddit.save
      redirect_to @subreddit, notice: 'Subreddit was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /subreddits/1
  def update
    if @subreddit.update(subreddit_params)
      redirect_to @subreddit, notice: 'Subreddit was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /subreddits/1
  def destroy
    @subreddit.destroy
    redirect_to subreddits_url, notice: 'Subreddit was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subreddit
      @subreddit = Subreddit.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def subreddit_params
      params.require(:subreddit).permit(:name, :genre, :founder)
    end
end
