class RemoveConditionFromTasks < ActiveRecord::Migration[6.1]
  def change
    remove_column :tasks, :condition, :text
  end
end
