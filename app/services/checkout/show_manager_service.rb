# frozen_string_literal: true

module Checkout
  class ShowManagerService
    attr_reader :address_billing, :address_shipping, :deliveries, :current_delivery, :order, :card

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
      @address_billing = set_billing_address
      @address_shipping = set_shipping_address
      @order.coupon&.update(active: false)
    end

    def delivery
      @deliveries = Delivery.all
    end

    def payment
      @card = set_credit_card
    end

    def confirm
      @address_billing = @order.user.billing_address
      @address_shipping = @order.user.shipping_address
      @current_delivery = @order.delivery
      @card = @order.card
    end

    def complete
      @order
    end

    private

    def set_credit_card
      @set_credit_card ||= @order.card || Card.new
    end

    def set_billing_address
      @order.user.billing_address ||= @order.user.try(:billing_address) 
    end

    def set_shipping_address
      @order.user.shipping_address ||= @order.user.try(:shipping_address)
    end
  end
end
