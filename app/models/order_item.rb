class OrderItem < ApplicationRecord
    belongs_to :book
    # belongs_to :user
    belongs_to :order, optional: true
  
    # validates :quantity, presence: true
    validates :book, presence: true

    scope :by_created, -> { order(created_at: :desc) }
end
