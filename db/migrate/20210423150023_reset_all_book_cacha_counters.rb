class ResetAllBookCachaCounters < ActiveRecord::Migration[6.1]
  def change
    Category.find_each do |category|
      Category.reset_counters(category.id, :books)
    end
  end
end
