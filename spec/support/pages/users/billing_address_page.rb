# frozen_string_literal: true

module Users
  class BillingAddress < SitePrism::Section
    element :first_name, '#user_billing_address_attributes_first_name'
    element :last_name, '#user_billing_address_attributes_last_name'

    element :addresses, '#user_billing_address_attributes_address'
    element :city, '#user_billing_address_attributes_city'
    element :zip, '#user_billing_address_attributes_zip'
    element :country, '#user_billing_address_attributes_country'
    element :phone_number, '#user_billing_address_attributes_phone_number'
    element :submit, '#billing_address_submit_id'

    def fill_in_billing_address(address)
      input_billing_address(address)
      input_user_name(address)
      submit.click
    end

    def input_billing_address(address)
      addresses.set address.address
      city.set address.city
      zip.set address.zip
      country.select address.country
      phone_number.set address.phone_number
    end

    def input_user_name(address)
      first_name.set address.first_name
      last_name.set address.last_name
    end
  end
end
