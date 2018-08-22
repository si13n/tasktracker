class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :summary
      t.text :description
      t.string :priority
      t.integer :tst
      t.integer :dev
      t.integer :tst_est
      t.integer :dev_est
      t.integer :created_by

      t.timestamps
    end
  end
end
