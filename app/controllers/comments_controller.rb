class CommentsController < ApplicationController
  before_action :find_task
  before_action :find_comment, only: %w[like dislike destroy]

  def create
    @comment = @task.comments.new comment_params
    @comment.user_id = current_user.id

    send_message if @comment.save
  end

  def like
    if current_user.liked? @comment
      @comment.unliked_by current_user
    else
      @comment.liked_by current_user
    end

    render 'vote.js.erb'
  end

  def dislike
    if current_user.disliked? @comment
      @comment.undisliked_by current_user
    else
      @comment.disliked_by current_user
    end

    render 'vote.js.erb'
  end

  def destroy
    @comment.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def send_message
    ActionCable.server.broadcast("room_channel_#{@task.id}", {
                                   message: @comment.message,
                                   name: name_or_comment,
                                   time: helpers.time_ago_in_words(@comment.created_at),
                                   image_src: image,
                                   like_count: @comment.weighted_score
                                 })
  end

  def name_or_comment
    User.find(@comment.user_id).name.nil? ? User.find(@comment.user_id).email : User.find(@comment.user_id).name
  end

  def image
    User.find(@comment.user_id).image
  end

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
