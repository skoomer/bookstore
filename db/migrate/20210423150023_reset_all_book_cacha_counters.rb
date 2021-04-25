class ResetAllBookCachaCounters < ActiveRecord::Migration[6.1]
  def change
    Category.all.each do |category|
      Category.reset_counters(category.id, :books)
    end
  end
end
