# frozen_string_literal: true

class CartDecorator < ApplicationDecorator
  delegate_all

  def sub_total
    object.quantity * object.book.price
  end
end