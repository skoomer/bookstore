# frozen_string_literal: true
require 'faker'

BOOK_MATERIAL = ['leather', 'glossy paper', 'matte paper'].freeze
CATEGORIES = ['Mobile Development', 'Photo', 'Web Desing', 'Web Development'].freeze

15.times { Author.create(first_name: Faker::Book.author) }

CATEGORIES.each do |category|
  Category.create(title: category)
end

15.times do
  book = Book.create(
    title: Faker::Book.title,
    price: Faker::Number.decimal(l_digits: 2),
    description: Faker::Books::Lovecraft.paragraph(sentence_count: 5),
    height: Faker::Number.decimal(l_digits: 1, r_digits: 1),
    width: Faker::Number.decimal(l_digits: 1, r_digits: 1),
    depth: Faker::Number.decimal(l_digits: 1, r_digits: 1),
    material: BOOK_MATERIAL.sample,
    quantity: Faker::Number.number(digits: 2),
    category_id: Category.all.sample.id,
    author_id: Author.all.sample.id

  )
end
