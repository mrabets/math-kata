class CommentsController < ApplicationController
  def create
    @task = Task.find(params[:task_id])
    @comment = @task.comments.create(params[:comment].permit(:message))
    redirect_to @task   
  end

  def destroy

  end
end
