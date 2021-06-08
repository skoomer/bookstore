class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|

      t.integer :quantity, default: 0

      t.belongs_to :book, index: true, foreign_key: true 
      t.belongs_to :order, index: true, foreign_key: true

      t.timestamps
    end
  end
end
