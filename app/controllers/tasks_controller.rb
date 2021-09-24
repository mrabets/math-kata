class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks.all
  end

  def show
    @task = current_user.tasks.find params[:id]
  end

  def new
    @task = current_user.tasks.new
    @task.tags.build
  end 

  def create
    @task = current_user.tasks.build task_params

    if @task.save
      flash[:success] = 'Your post has successfully added'
      redirect_to @task
    else
      render 'new'
    end
  end

  private

  def task_params
    params.require(:task).permit(:title, :condition, :answers, tags_attributes: [:id, :name])
  end
end
