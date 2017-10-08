class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
      t.references :task, foreign_key: true
      t.string :file
      t.string :name

      t.timestamps
    end
  end
end
