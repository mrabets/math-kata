class TasksController < ApplicationController
  skip_before_action :authenticate_user!, only: %w[index show]
  before_action :find_task, only: %w[show answer edit update destroy]

  def index
    @tasks = if params[:subject]
               Task.where(subject: params[:subject])
             elsif params[:tag]
               Task.tagged_with(params[:tag])
             elsif params[:query]
               Task.search_for(params[:query])
             else
               Task.all
             end
  end

  def show; end

  def answer
    @answer = params[:answer]

    unless @answer.blank?
      if helpers.correct_answer?(@answer, @task.id)
        current_user.solved_tasks.create! task_id: @task.id
        flash[:success] = 'Correct answer'
      else
        flash[:alert] = 'Wrong answer'
      end
    end

    redirect_to @task
  end

  def new
    @task = current_user.tasks.new
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

  def edit; end

  def update
    @task.answers.delete!(' ')

    if @task.update task_params
      flash[:success] = 'Your task has successfully updated'
      redirect_to @task
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to root_path
  end

  private

  def find_task
    @task = Task.find params[:id]
  end

  def task_params
    params.require(:task).permit(:title, :condition, :answers, :subject, :tag_list, images: [])
  end
end
