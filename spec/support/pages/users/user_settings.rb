# frozen_string_literal: true

module Users
  class UserSettingsPage < SitePrism::Page
    set_url '/users/edit'

    element :flash_success, '.alert.alert-success'

    element :user_privacy_link, '.nav-item', text: I18n.t('devise.registrations.edit.privacy')
    element :user_address_link, '.nav-item', text: I18n.t('devise.registrations.edit.address')

    section :billing_address, Users::BillingAddress, '#addresses'
    section :shipping_address, Users::ShippingAddress, '#addresses'

    section :privacy_form, Users::PrivacyForm, '#privacy'
  end
end