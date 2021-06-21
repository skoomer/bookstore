# frozen_string_literal: true

FactoryBot.define do
  factory :card do
    card_holder { FFaker::Lorem.word }
    number { (16.times.map { Random.rand(9) }).join }
    valid_thru { "10/#{Time.zone.now.year.to_s.last(2)}" }
    cvv { (3.times.map { Random.rand(9) }).join }
    order { nil }
  end
end
