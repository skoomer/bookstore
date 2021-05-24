# frozen_string_literal: true

FactoryBot.define do
  factory :address do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    address { FFaker::AddressUA.street_name }
    city { FFaker::AddressUA.city }
    zip { FFaker::AddressUA.zip_code }
    country { FFaker::AddressUA.country }
    phone_number { FFaker::PhoneNumberUA.home_phone_number }
  end
end
