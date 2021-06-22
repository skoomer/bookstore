# frozen_string_literal: true

FactoryBot.define do
  factory :delivery do
    name { FFaker::Lorem.phrase }
    time_shipping { FFaker::Time.day_of_week }
    price { rand(20..30) }
  end
end
