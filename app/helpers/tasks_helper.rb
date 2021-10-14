module TasksHelper
  def get_user_by_task_id(task)
    User.find task.user_id
  end

  def correct_answer?(current_answer, task_id)
    Task.find(task_id).answers.split(';').any?(current_answer)
  end
end
