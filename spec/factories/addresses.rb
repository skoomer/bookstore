# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    address { FFaker::Address.street_name }
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    city { FFaker::AddressUA.city }
    zip { FFaker::AddressUA.zip_code }
    country { ISO3166::Country.all_translated.sample }
    phone_number { FFaker::PhoneNumberUA.international_mobile_phone_number.gsub!(/\s/, '').delete('-') }
    user

    trait :with_billing_address do
      type { 'BillingAddress' }
    end

    trait :with_shipping_address do
      type { 'ShippingAddress' }
    end
  end
end
