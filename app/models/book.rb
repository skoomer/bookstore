# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :category, counter_cache: :books_count
  belongs_to :author

  validates :title, presence: true
end
