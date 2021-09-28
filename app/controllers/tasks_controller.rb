class TasksController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index, :show]

  def index
    # @tasks = Task.all

    @q = Task.ransack(params[:q])
    @tasks = @q.result(distinct: true)
  end

  def show
    @task = Task.find params[:id]
    @answer = params[:answer]

    unless @answer.blank?
      if helpers.correct_answer?(@answer, @task.id)
        flash[:success] = 'Yes'
      else
        flash[:alert] = 'No'
      end
    end
  end

  def new
    @task = current_user.tasks.new
    @task.tags.build
  end 

  def create
    @task = current_user.tasks.build task_params
    @task.answers.delete!(' ')

    if @task.save
      flash[:success] = 'Your task has successfully added'
      redirect_to @task
    else
      render 'new'
    end
  end

  def edit
    @task = current_user.tasks.find params[:id]
  end

  def update
    @task = current_user.tasks.find params[:id]
    @task.answers.delete!(' ')

    if @task.update task_params
      flash[:success] = 'Your task has successfully updated'
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    @task = current_user.tasks.find params[:id]
    @task.destroy

    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:title, :condition, :answers, :subject, tags_attributes: [:id, :name], images: [])
  end
end
