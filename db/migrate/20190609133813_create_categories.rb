class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name, default: '', null: false
      t.boolean :active, default: true, null: false

      t.timestamps

      t.index :name, unique: true
    end
  end
end
