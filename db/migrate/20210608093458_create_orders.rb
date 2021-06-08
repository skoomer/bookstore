class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.datetime :compleated_at
      t.datetime :deleted_at
      
      t.string :number

      t.integer :status, default: 0
      t.decimal :total_price, precision: 8, scale: 2

      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
