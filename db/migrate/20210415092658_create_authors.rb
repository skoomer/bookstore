class CreateAuthors < ActiveRecord::Migration[6.1]
  def change
    create_table :authors do |t|
      t.string :first_name, :limit => 20, :null => false
      t.string :last_name
      t.timestamps
    end
  end
end
