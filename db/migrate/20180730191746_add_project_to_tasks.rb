class AddProjectToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :project, :integer
  end
end
