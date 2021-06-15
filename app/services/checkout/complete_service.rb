# frozen_string_literal: true

module Checkout
  class CompleteService
    def initialize(order, user)
      @order = order
      @user = user
    end

    def call(step)
      case step
      when :address then address
      when :delivery then delivery
      when :payment then payment
      when :confirm then confirm
      when :complete then complete
      end
    end

    def address
      @order.user
    end

    def delivery
      @order.user.billing_address.present? && @order.user.shipping_address.present?
    end

    def payment
      @order.delivery
    end

    def confirm
      @order.card
    end

    def complete
      @order.compleated_at?
    end
  end
end
