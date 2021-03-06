# frozen_string_literal: true

class Book < ApplicationRecord
  belongs_to :category, counter_cache: :books_count
  belongs_to :author

  validates :title, :price, :description, :publication_year, presence: true
  validates :title, format: { with: Constants::NAME_FORMAT }, length: { maximum: Constants::MAXIMUM_NAME_LENGTH }
end
