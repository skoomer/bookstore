class CreateCarts < ActiveRecord::Migration[6.1]
  def change
    create_table :carts do |t|
      t.references :user, null: true, foreign_key: true, on_delete: :cascade
      t.string :session_id
      t.references :book, null: false, foreign_key: true, on_delete: :cascade
      t.integer :quantity



      t.timestamps
    end
  end
end
