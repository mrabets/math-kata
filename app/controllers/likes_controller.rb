class LikesController < ApplicationController
  def create
    comment.likes.create(user_id: current_user.id)
    redirect_to task_path(task)
  end

  def destroy
    comment.likes.where(user_id: current_user.id).destroy_all
    redirect_to task_path(task)
  end

  private

  def task
    @task = Task.find(params[:task_id])
  end

  def comment
    unless params[:comment_id].nil?
      @comment = task.comments.find(params[:comment_id])
    end
  end
end
