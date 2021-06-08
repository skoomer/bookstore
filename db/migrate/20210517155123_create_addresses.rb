class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :type
      t.string :first_name
      t.string :last_name
      t.string :city
      t.string :address
      t.string :country
      t.integer :zip
      t.string :phone_number
      t.references :user
    
      t.timestamps
    end
  end
end
