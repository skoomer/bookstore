class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.datetime :completed_at
      t.datetime :deleted_at
      
      t.string :number

      t.integer :status, default: 0
      t.decimal :total_price, precision: 8, scale: 2

      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :book, index: true, foreign_key: true

      t.timestamps
    end
    add_index :orders, :deleted_at
  end
end
