# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::String.from_regexp(User::PASSWORD_FORMAT_REGEX) }

    trait :with_facebook do
      provider { :facebook }
      uid { rand(5) }
    end

    factory :user_with_addresses do
      association :shipping_address, factory: :address
      association :billing_address, factory: :address
    end
  end
end
