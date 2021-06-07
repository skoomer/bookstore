class Cart < ApplicationRecord
    belongs_to :user, optional: true
    belongs_to :book
    has_many :cart_items

    
    def add_product(product_params)
        current_item = cart_items.find_by(book_id: book_params[:book][:book_id])
        if current_item
          current_item.quantity += book_params[:book][:quantity].to_i
        current_item.save
        else
        new_item = cart_items.create(book_id: product_params[:book][:book_id],
          quantity: product_params[:book][:quantity],
          cart_id: self.id)
        end
        new_item
      end
end
