# frozen_string_literal: true

FactoryBot.define do
  factory :delivery do
    name { 'MyString' }
    time_shipping { 'MyString' }
    price { rand(20..30) }
  end
end
