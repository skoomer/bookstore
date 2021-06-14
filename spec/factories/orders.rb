# frozen_string_literal: true

FactoryBot.define do
  factory :order do
    number { 1}
    status { 1 }
    user

    trait :with_items do
      order_items { build_list :order_item, rand(1..10) }
    end
  
    trait :completed do
      status { Order.statuses[:completed] }
    end

    trait :in_progress do
      status { Order.statuses[:in_progress] }
    end

    trait :in_delivery do
      status { Order.statuses[:in_delivery] }
    end

    trait :delivered do
      status { Order.statuses[:delivered] }
    end
    trait :canceled do
      status { Order.statuses[:canceled] }
    end

    trait :add_coupon do
      after(:create) do |order|
        order.coupon = create(:coupon)
        order.save
      end
    end

    trait :add_addresses do
      after(:create) do |order|
        order.billing_address = create(:address)
        order.shipping_address = create(:address)
        order.save
      end
    end
  end
end
