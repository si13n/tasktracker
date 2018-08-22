class AddIsAdminToUsers < ActiveRecord::Migration[5.1]
  def change
    add_reference :users, :team, index: true, foreign_key: true
    add_column :users, :is_admin, :boolean, default: false
  end
end
