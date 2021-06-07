# frozen_string_literal: true

class CartsController < ApplicationController
  before_action :set_cart, only: [:create, :destroy]
  def index



    # cart_items
   
  end

  def destroy
    @cart_item.destroy
    redirect_to cart_path
  end

  def create
    @cart.add_product(params)
     
    if @cart.save
      redirect_to cart_path
    else
      flash[:error] = 'There was a problem adding this item to your cart.'
      redirect_to @book
    end
  end

  # def create
  #   @cart = Cart.create(cart_item_params)

  #   respond_to do |format|
  #     if @cart.save
  #       format.js { render partial: 'partials/header', status: :ok }
  #     else
  #       format.js do
  #         render partial: 'partials/header', status: :unprocessable_entity, notice: t('unprocessable_entity')
  #       end
  #     end
  #   end
  # end



  # def update_cart
  #   params[:items].each do |item|
  #     order_item = @cart.order_items.find(item[:id])
  #     order_item.update(quantity: item[:quantity])
  #   end
  # end

  private

  

  # def cart_items
  #   @cart_items ||= policy_scope(Cart)
  # end

  # def cart_item
  #   @cart_item ||= Cart.find_by!(id: params[:id]) if params[:id].present?
  # end

  # def cart_item_params
  #   params.require(:cart_item).permit(:book_id, :quantity)
  #         .merge(session_id: session.id.to_s, user_id: current_user&.id)
  # end

end
