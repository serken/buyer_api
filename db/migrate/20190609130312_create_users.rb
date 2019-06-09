class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email, default: '', null: false
      t.string :password, default: '', null: false
      t.string :first_name, default: ''
      t.string :last_name, default: ''
      t.string :login, default: ''
      t.string :description, default: ''
      t.string :about, default: ''
      t.string :avatar, default: ''
      t.string :number, default: ''

      t.timestamps

      t.index :email, unique: true
      t.index :login, unique: true
    end
  end
end
