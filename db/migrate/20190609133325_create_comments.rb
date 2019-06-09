class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :commentable_type
      t.integer :commentable_id
      t.integer :user_id
      t.string :message, default: '', null: false

      t.timestamps
    end
  end
end
