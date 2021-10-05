class CommentsController < ApplicationController
  before_action :find_task
  before_action :find_comment, only: [:like, :unlike, :dislike, :undislike]

  def create
    @comment = @task.comments.new comment_params
    @comment.user_id = current_user.id
    @comment.save

    respond_to do |format|
      format.html { redirect_to @task }
      format.js
    end
  end

  def like
    unless current_user.liked? @comment
      @comment.liked_by current_user
    else
      @comment.unliked_by current_user
    end

    render "vote.js.erb" 
  end


  def dislike
    unless current_user.disliked? @comment
      @comment.disliked_by current_user
    else
      @comment.undisliked_by current_user
    end

    render "vote.js.erb" 
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
