# frozen_string_literal: true
require 'ffaker'

BOOK_MATERIAL = ['leather', 'glossy paper', 'matte paper'].freeze
CATEGORIES = ['Mobile Development', 'Photo', 'Web Desing', 'Web Development'].freeze

15.times { Author.create(first_name: FFaker::Name.first_name, last_name: FFaker::Name.last_name) }

CATEGORIES.each do |category|
  Category.create(title: category)
end

15.times do
  book = Book.create(
    title: FFaker::Book.title,
    price: rand(10.0..150.0).floor(2),
    description:  FFaker::Book.description(10),
    publication_year: rand(2000...Time.zone.now.year),
    height: rand(0.1...0.9).floor(1),
    width: rand(0.1...0.9).floor(1),
    depth: rand(0.1...0.9).floor(1),
    material: BOOK_MATERIAL.sample,
    quantity: rand(1),
    category: Category.all.sample,
    author: Author.all.sample
  )
end
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?