# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { FFaker::Internet.email }
    password { FFaker::String.from_regexp(User::PASSWORD_FORMAT_REGEX) }
    provider { :facebook }
  end
end
