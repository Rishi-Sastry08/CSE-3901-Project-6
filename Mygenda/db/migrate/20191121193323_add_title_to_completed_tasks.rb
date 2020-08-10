class AddTitleToCompletedTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :completed_tasks, :title, :string
  end
end
