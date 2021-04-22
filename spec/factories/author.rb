# frozen_string_literal: true

FactoryBot.define do
  factory :author, class: 'Author' do
    first_name { Faker::Book.author }
    last_name { Faker::Book.author }
  end
end
