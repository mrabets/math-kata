class AddSolvedTasksToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :solved_tasks, :integer, default: 0
  end
end
