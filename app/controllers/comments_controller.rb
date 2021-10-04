class CommentsController < ApplicationController
  before_action :find_task
  before_action :find_comment, only: [:like, :unlike, :dislike, :undislike]

  def create
    @comment.user_id = current_user.id
    @comment.save
    redirect_to @task       
  end

  def like
    @comment.liked_by current_user
    redirect_to @task
  end

  def unlike
    @comment.unliked_by current_user
    redirect_to @task
  end

  def dislike
    @comment.disliked_by current_user
    redirect_to @task
  end

  def undislike
    @comment.undisliked_by current_user
    redirect_to @task
  end

  def destroy

  end

  private

  def find_task
    @task = Task.find(params[:task_id])
  end

  def find_comment
    @comment = Comment.find params[:id]
  end

  def comment_params
    params.require(:comment).permit(:message)
  end
end
