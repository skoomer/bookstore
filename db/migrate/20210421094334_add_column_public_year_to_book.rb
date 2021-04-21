class AddColumnPublicYearToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :publication_yer, :integer
  end
end
