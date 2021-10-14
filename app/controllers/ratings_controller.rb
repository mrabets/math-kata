class RatingsController < ApplicationController
  def create
    @task = Task.find params[:task_id]
    @rating = @task.ratings.new rating_params
    @rating.user_id = current_user.id
    redirect_to @task if @rating.save
  end

  private

  def rating_params
    params.require(:rating).permit(:score)
  end
end
