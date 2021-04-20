class ChangeBookFieldTitleLimit < ActiveRecord::Migration[6.1]
  def change
    change_column :books, :title, :string, :limit => 50
  end
end
