class AddTaskToComments < ActiveRecord::Migration[5.2]
  def change
    add_reference :comments, :task, index: true, foreign_key: true
  end
end
