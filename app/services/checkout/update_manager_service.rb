# frozen_string_literal: true

module Checkout
  class UpdateManagerService
    def initialize(order, params, session)
      @order = order
      @params = params
      @session = session
    end

    def call(step)
      case step
      when :address then address
      when :delivery then delivery
      when :payment then payment
      when :confirm then confirm
      end
    end

    def address
      @address_billing = @order.user.billing_address ? update_billing('billing') : create_billing('billing')
      @address_shipping = update_and_create_shipping_address
      @order.save
    end

    def delivery
      @order.update(delivery_id: order_params[:delivery_id])
    end

    def payment
      @order.card ? @order.card.update(card_params) : @order.create_card(card_params)
    end

    def confirm
      OrderMailer.complete_order(@order).deliver
      @order.update(compleated_at: Time.zone.now)
      @session.delete(:current_order_id)
    end

    private

    def update_and_create_shipping_address
      if @order.user.shipping_address
        use_billing ? update_shipping('billing') : update_shipping('shipping')
      else
        use_billing ? create_shipping('billing') : create_shipping('shipping')
      end
    end

    def create_shipping(shipping)
      @order.user.create_shipping_address(address_params(shipping))
    end

    def create_billing(billing)
      @order.user.create_billing_address(address_params(billing))
    end

    def update_shipping(shipping)
      @order.user.shipping_address.update(address_params(shipping))
    end

    def update_billing(billing)
      @order.user.billing_address.update(address_params(billing))
    end

    def address_params(type)
      @params.fetch(:address).require(type.to_s).permit(:first_name, :last_name, :address,
                                                        :country, :city, :zip, :phone_number, :use_billing)
    end

    def use_billing
      @params[:use_billing]
    end

    def card_params
      @params.require(:card).permit(:number, :card_holder, :valid_thru, :cvv)
    end

    def order_params
      @params.fetch(:order)
    end
  end
end
