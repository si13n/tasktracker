class AddCommentToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :comment, :text
  end
end
