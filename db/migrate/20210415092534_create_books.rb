class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, :limit => 32, :null => false
      t.float :price
      t.text :description
      t.timestamps
    end
  end
end
