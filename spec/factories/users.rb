# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::String.from_regexp(User::PASSWORD_FORMAT_REGEX) }

    trait :with_facebook do
      provider { :facebook }
      uid { rand(5) }
    end

    trait :user_with_shipping_addresses do
      association :shipping_address, factory: :address
    end

    trait :user_with_billing_addresses do
      association :billing_address, factory: :address
    end

    trait :add_address do
      after(:create) do |user|
        user.billing_address = create(:billing_address)
        user.shipping_address = create(:shipping_address)
        user.save
      end
    end

    trait :user_with_order do
      after(:create) do |user|
        user.orders << create(:order, user: user)
      end
    end
  end
end
