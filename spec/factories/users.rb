# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::String.from_regexp(User::PASSWORD_FORMAT_REGEX) }
  end

  trait :with_facebook do
    password { Devise.friendly_token[0, 20] }
    provider { :facebook }
  end
end
