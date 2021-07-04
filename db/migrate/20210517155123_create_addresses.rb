class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :type
      t.string :first_name, null: false, limit: 50
      t.string :last_name, null: false, limit: 50
      t.string :city, null: false, limit: 50
      t.string :address, null: false, limit: 50
      t.string :country, null: false, limit: 50
      t.string :zip, null: false, limit: 10
      t.string :phone_number, null: false, limit: 15
      t.belongs_to :user
    
      t.timestamps
    end
  end
end
