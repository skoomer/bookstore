class AddFieldBooks < ActiveRecord::Migration[6.1]
  def change
    add_reference :books, :author, foreign_key: true
    add_reference :books, :category, foreign_key: true

    add_column :books, :height, :float
    add_column :books, :width, :float
    add_column :books, :depth, :float
    add_column :books, :material, :string
    add_column :books, :quantity, :integer
  
  end
end
