class CreateTags < ActiveRecord::Migration[6.1]
  def change
    create_table :tags do |t|
      t.string :name
      t.integer :task_id

      t.timestamps
    end

    add_index :tags, :task_id
  end
end
