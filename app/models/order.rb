class Order < ApplicationRecord
    attr_accessor :active_admin_requested_event
    include AASM
   
    has_many :order_items, dependent: :destroy
    belongs_to :user, optional: true

    scope :order_not_in_progress, -> { where.not(status: :in_progress) }

    enum status: {
      in_progress: 0,
      completed: 1,
      canceled: 2
    }

    aasm column: :status, enum: true do
        state :in_progress, initial: true
        state :completed
        state :canceled
    
        event :completed do
          transitions from: :in_progress, to: :completed
        end
    
    
        event :canceled do
          transitions from: %i[in_progress completed], to: :canceled
        end
      end

      def total
        price_with_disc + (delivery&.price || 0.00)
      end
    
      def subtotal_price
        order_items.sum { |item| item.quantity * item.book.price }
      end
end
