class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.text :tag
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
