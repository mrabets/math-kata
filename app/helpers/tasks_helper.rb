module TasksHelper
  def correct_answer?(current_answer, task_id)
    return Task.find(task_id).answers.split(';').any?(current_answer)
  end
end
