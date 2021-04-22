class ChangeBookColumnYear < ActiveRecord::Migration[6.1]
  def change
    rename_column :books, :publication_yer, :publication_year
  end
end
