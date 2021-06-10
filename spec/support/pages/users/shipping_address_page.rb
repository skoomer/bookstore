# frozen_string_literal: true

  class Users::ShippingAddress < SitePrism::Section
    element :first_name, '#user_shipping_address_attributes_first_name'
    element :last_name, '#user_shipping_address_attributes_last_name'
    element :address, '#user_shipping_address_attributes_address'
    element :city, '#user_shipping_address_attributes_city'
    element :zip, '#user_shipping_address_attributes_zip'
    element :country, '#user_shipping_address_attributes_country'
    element :phone_number, '#user_shipping_address_attributes_phone_number'
    element :submit, '#shipping_address_submit_id'

    def initialize_shipping_address(address)
      set_shipping_address(address)
      submit.click
    end

    def set_shipping_address(address)
      address.set address.address
      city.set address.city
      zip.set address.zip
      country.select address.country
      first_name.set address.first_name
      last_name.set address.last_name
      phone_number.set address.phone_number
    end

  end

