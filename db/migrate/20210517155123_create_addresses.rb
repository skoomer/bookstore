class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :first_name, :null => false
      t.string :last_name, :null => false
      t.string :city, :null => false
      t.string :address, :null => false
      t.string :country, :null => false
      t.integer :zip, :null => false
      t.string :phone_number, :null => false
      t.timestamps
    end
  end
end
