# frozen_string_literal: true

module Users
  class BillingAddress < SitePrism::Section
    element :title, '.settings-title', text: I18n.t('devise.registrations.edit.address.billing_address')

    element :first_name, '#user_billing_address_attributes_first_name'
    element :last_name, '#user_billing_address_attributes_last_name'

    element :address_f, '#user_billing_address_attributes_address'
    
    element :city, '#user_billing_address_attributes_city'
    element :zip, '#user_billing_address_attributes_zip'
    element :country, '#user_billing_address_attributes_country'
    element :phone_number, '#user_billing_address_attributes_phone_number'
    element :submit, '#billing_address_submit_id'

    def initialize_billing_address(address)
      set_billing_address(address)
      submit.click
    end

    private

    def set_billing_address(address)
      address_f.set address.address
      city.set address.city
      zip.set address.zip
      country.select address.country
      first_name.set address.first_name
      last_name.set address.last_name
      phone_number.set address.phone_number
    end
  end
end
