# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::String.from_regexp(User::PASSWORD_FORMAT_REGEX) }

    trait :with_facebook do
      password { User::DEFAULT_PASSWORD }
      provider { :facebook }
      uid { rand(5) }
    end
  end
end
