class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.integer :position
      t.boolean :checked
      t.datetime :complete_at
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
