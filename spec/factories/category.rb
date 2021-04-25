# frozen_string_literal: true
CATEGORY = ['Mobile Development', 'Photo', 'Web Desing', 'Web Development'].freeze
FactoryBot.define do
  factory :category do
    title { CATEGORY.sample }
  end
end
