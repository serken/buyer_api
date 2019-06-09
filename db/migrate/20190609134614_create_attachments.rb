class CreateAttachments < ActiveRecord::Migration[6.0]
  def change
    create_table :attachments do |t|
      t.string :attachable_type
      t.integer :attachable_id
      t.integer :user_id
      t.string :file
      t.string :filename
      t.integer :filesize

      t.timestamps
    end
  end
end
