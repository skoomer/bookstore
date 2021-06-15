class CreateDeliveries < ActiveRecord::Migration[6.1]
  def change
    create_table :deliveries do |t|
      t.string :name
      t.string :time_shipping
      t.decimal :price

      t.timestamps
    end
  end
end
