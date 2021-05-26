# frozen_string_literal: true

class Author < ApplicationRecord
  has_many :books, dependent: :destroy

  validates :first_name, presence: true, format: { with: Constants::NAME_FORMAT },
                         length: { maximum: Constants::MAXIMUM_NAME_LENGTH }
  validates :last_name, presence: true, format: { with: Constants::NAME_FORMAT },
                        length: { maximum: Constants::MAXIMUM_NAME_LENGTH }
end
