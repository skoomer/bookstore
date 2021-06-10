# frozen_string_literal: true



  class Users::UserSettingsPage < SitePrism::Page
    set_url '/users/edit'

    element :flash_success, '.alert.alert-success'

    element :user_privacy_link, '.nav-item', text: I18n.t('devise.registrations.edit.privacy')
    element :user_address_link, '.nav-item', text: I18n.t('devise.registrations.edit.address')

    section :billing_address_form, Users::BillingAddress,  '#addresses > div > div:nth-child(1)'
    # section :shipping_address, Users::ShippingAddress, '#addresses > div > div:nth-child(2)'

    section :privacy_form, Users::PrivacyForm, '#privacy'
  end

