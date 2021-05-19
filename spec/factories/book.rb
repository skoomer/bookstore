# frozen_string_literal: true

FactoryBot.define do
  factory :book do
    title { FFaker::Book.title }
    price { rand(10.0..150.0).floor(2) }
    description { FFaker::Book.description(10) }
    publication_year { rand(2000...Time.zone.now.year) }
    height { rand(0.1...0.9).floor(1) }
    width { rand(0.1...0.9).floor(1) }
    depth { rand(0.1...0.9).floor(1) }
    material { FFaker::Skill.tech_skill }
    quantity { rand(50) }
    category
    author
  end
end
