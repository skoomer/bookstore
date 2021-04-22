# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    price { Faker::Number.decimal(l_digits: 2) }
    description { Faker::Books::Lovecraft.paragraph(sentence_count: 5) }
    height { Faker::Number.decimal(l_digits: 1, r_digits: 1) }
    width { Faker::Number.decimal(l_digits: 1, r_digits: 1) }
    depth { Faker::Number.decimal(l_digits: 1, r_digits: 1) }
    quantity { Faker::Number.number(digits: 2) }
  end
end
