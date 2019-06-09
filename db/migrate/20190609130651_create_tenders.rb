class CreateTenders < ActiveRecord::Migration[6.0]
  def change
    create_table :tenders do |t|
      t.integer :user_id, null: false
      t.string :title, null: false
      t.text :description, default: ''
      t.integer :category_id, null: false
      t.string :img, default: ''
      t.boolean :active, default: false, null: false
      t.datetime :expire_at, null: false
      t.integer :price, default: 0, null: false
      t.string :country
      t.string :city

      t.timestamps
    end
  end
end
