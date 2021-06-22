# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    card_holder { FFaker::Lorem.word }
    number { FFaker::Bank.card_number.gsub!(/\s/, '') }
    valid_thru { FFaker::Bank.card_expiry_date }
    cvv { (Array.new(3) { Random.rand(9) }).join }
    order { nil }
  end
end
