class AddSubjectToTasks < ActiveRecord::Migration[6.1]
  def change
    add_column :tasks, :subject, :string
  end
end
