# frozen_string_literal: true

BOOK_MATERIAL = ['hardcover', 'glossy paper', 'matte paper'].freeze

FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
    price { rand(10.0..150.0).floor(2) }
    description { FFaker::Book.description(10) }
    publication_year { rand(2000...Time.zone.now.year) }
    height { rand(0.1...0.9).floor(1) }
    width { rand(0.1...0.9).floor(1) }
    depth { rand(0.1...0.9).floor(1) }
    material { BOOK_MATERIAL.sample }
    quantity { rand(50) }
    category
    author
  end

  trait :attach_author do
    after(:create) do |_book|
      create_list(:author, rand(1..3))
    end
  end
end