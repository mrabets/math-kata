module TasksHelper
  def created_date(task)
    task.created_at.strftime('%d %b %Y, %H:%M')
  end

  def user_name_link(task)
    link_to(user_by_task_id(task).name, user_by_task_id(task))
  end

  def task_link(task)
    link_to task.title, task, { style: 'text-decoration:none;  color:inherit' }
  end

  def subject_link(task)
    link_to task.subject, subject_path(task.subject),
            class: 'badge bg-secondary text-decoration-none link-light'
  end

  def tags(task)
    task.tags.map { |tag| link_to(tag, tag_path(tag.name)) }.join(', ').html_safe
  end

  def edit_link(task)
    link_to t('tasks.edit'), edit_task_path(task), class: 'btn btn-warning btn-sm'
  end

  def delete_link(task)
    link_to t('tasks.delete'), task_path(task), method: :delete,
                                                data: { confirm: 'Are you sure?' }, class: 'btn btn-danger btn-sm'
  end

  def no_answer?(task)
    current_user.solved_tasks.find_by(task_id: task.id).nil? if current_user
  end

  def no_rating?(task)
    current_user.ratings.find_by(task_id: task.id).nil? if current_user
  end

  def comment_count(task)
    task.comments.count
  end

  def user_by_task_id(task)
    User.find task.user_id
  end

  def subjects
    Subject.all.map(&:name)
  end

  def correct_answer?(current_answer, task_id)
    Task.find(task_id).answers.split(';').any?(current_answer)
  end
end
