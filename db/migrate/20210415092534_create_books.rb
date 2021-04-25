class CreateBooks < ActiveRecord::Migration[6.1]
  def change
    create_table :books do |t|
      t.string :title, :null => false
      t.float :price, precision: 12, scale: 2
      t.text :description

      t.float :height
      t.float :width
      t.float :depth
      t.string :material
      t.integer :quantity
      t.integer :publication_year
      t.references :category, foreign_key: true
      t.references :author, foreign_key: true
      t.timestamps
    end
  end
end
