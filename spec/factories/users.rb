# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { Devise.friendly_token[0, 20] }

    trait :with_facebook do
      provider { :facebook }
      uid { rand(5) }
    end
  end
end
