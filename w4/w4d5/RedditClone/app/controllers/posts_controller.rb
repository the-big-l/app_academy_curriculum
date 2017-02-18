class PostsController < ApplicationController

  def create
    @post = Post.new(post_params)
    @post.sub_id = params[:sub_id]
    @post.author_id = current_user.id
    if @post.save
      redirect_to @post
    else
      flash.now[:errors] = @post.errors.full_messages
    end
  end

  def new
    render :new
  end


  def show
  end

  def edit
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end
end
