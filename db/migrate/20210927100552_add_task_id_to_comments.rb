class AddTaskIdToComments < ActiveRecord::Migration[6.1]
  def change
    add_column :comments, :task_id, :integer
  end
end
