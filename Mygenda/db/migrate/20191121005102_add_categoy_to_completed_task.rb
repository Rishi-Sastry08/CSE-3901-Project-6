class AddCategoyToCompletedTask < ActiveRecord::Migration[5.2]
  def change
    add_column :completed_tasks, :category, :string
  end
end
