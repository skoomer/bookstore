# frozen_string_literal: true

FactoryBot.define do
  factory :order_item do
    quantity { 1 }
    book 
    order
  end
end
