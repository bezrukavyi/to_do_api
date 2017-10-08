class CreateProjects < ActiveRecord::Migration[5.1]
  def change
    create_table :projects do |t|
      t.string :title
      t.datetime :complete_at
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
