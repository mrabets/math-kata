module UsersHelper
  def solved_tasks_count(user)
    user.solved_tasks.count
  end

  def all_tasks_count(user)
    user.tasks.count
  end
end
