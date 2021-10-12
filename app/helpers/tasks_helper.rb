module TasksHelper
  def get_user_by_task_id(task)
    return User.find task.user_id
  end

  def correct_answer?(current_answer, task_id)
    return Task.find(task_id).answers.split(';').any?(current_answer)
  end
end
