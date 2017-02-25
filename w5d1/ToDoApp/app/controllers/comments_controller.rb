class CommentsController < ApplicationController
  def create
    @comment = current_user.authored_comments.new(comment_params)

    if @comment.save
      redirect_to goal_url(@comment.goal)
    else
      flash[:errors] = ['esp']
      redirect_to goal_url(@comment.goal)
    end
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy
    redirect_to goal_url(comment.commenticity)
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
