class CommentsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.new comment_params
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @task       
  end

  def like
    @task = Task.find(params[:task_id])
    @comment = Comment.find params[:id]
    @comment.liked_by current_user
    redirect_to @task
  end

  def dislike
    @task = Task.find(params[:task_id])
    @comment = Comment.find params[:id]
    @comment.disliked_by current_user
    redirect_to @task
  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
