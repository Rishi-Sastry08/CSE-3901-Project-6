class ChangeFieldInPosts < ActiveRecord::Migration[5.2]
  def change
    change_column(:posts, :due_date, :date)
  end
end
