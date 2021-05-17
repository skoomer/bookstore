class AddressController < ApplicationController

    before_action :set_addresses
    def edit
    end
    def update
        # binding.pry
        @addresses_shipping.update(safe_params) if params_address == 'shipping'
        @addresses_billing.update(safe_params) if params_address == 'billing'

        current_user.save
        render :edit
    end
    

    def params_address
        params[:address][:address_type] unless params[:address].nil?
    end

    def set_addresses
        @addresses_billing = set_address_billing
        @addresses_shipping = set_address_shipping
    end

    def set_address_billing
        return current_user.build_billing_address if params_address == 'billing'

        current_user.billing_address || Address.new
    end

    def set_address_shipping
        return current_user.build_shipping_address if params_address == 'shipping'

        current_user.shipping_address || Address.new
    end

    def safe_params
        params.require(:address).permit(:first_name, :last_name, :address,
            :country, :city, :zip, :phone_number)

    def edit
    end
    def update
    end
    def create

    end
end
