class CreateProposals < ActiveRecord::Migration[6.0]
  def change
    create_table :proposals do |t|
      t.integer :tender_id, null: false
      t.integer :user_id, null: false
      t.string :text, default: ''
      t.integer :price, null: false
      t.string :currency, default: 'USD'
      t.boolean :active, default: true, null: false

      t.timestamps
    end
  end
end
