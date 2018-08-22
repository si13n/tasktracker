class RemoveEstFromTasks < ActiveRecord::Migration[5.2]
  def up
    remove_column :tasks, :tst
    remove_column :tasks, :dev
    remove_column :tasks, :tst_est
    remove_column :tasks, :dev_est
  end

  def down
    add_column :tasks, :tst, :integer
    add_column :tasks, :dev, :integer
    add_column :tasks, :tst_est, :integer
    add_column :tasks, :dev_est, :integer
  end
end
