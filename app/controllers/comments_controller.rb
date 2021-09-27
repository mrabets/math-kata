class CommentsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.new comment_params
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @task       
  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
