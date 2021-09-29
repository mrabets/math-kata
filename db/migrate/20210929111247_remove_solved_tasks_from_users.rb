class RemoveSolvedTasksFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :solved_tasks, :integer
  end
end
