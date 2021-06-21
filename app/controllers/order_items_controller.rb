# frozen_string_literal: true

class OrderItemsController < ApplicationController
  before_action :set_order_item, only: %i[update destroy]

  def create
    @order_item = current_order.order_items.find_or_create_by(book_id: order_params[:book_id])
    @order_item.update(quantity: @order_item.quantity + order_params[:quantity].to_i)
    redirect_back(fallback_location: root_path)
  end

  def update
    return destroy if @order_item.quantity == 1 && order_params[:quantity].to_i.negative?

    @order_item.update(quantity: @order_item.quantity + order_params[:quantity].to_i)

    redirect_back(fallback_location: root_path)
  end

  def destroy
    @order_item.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def set_order_item
    @order_item = current_order.order_items.find_by(id: params[:id])
  end

  def order_params
    params.require(:order_item).permit(:book_id, :quantity)
  end
end
