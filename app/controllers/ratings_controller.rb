class RatingsController < ApplicationController
  def create
    @task = Task.find params[:task_id]
    @rating = @task.ratings.new rating_params
    @rating.user_id = current_user.id
    if @rating.save
      redirect_to @task
    end
  end

  private

  def rating_params
    params.require(:rating).permit(:score)
  end
end
