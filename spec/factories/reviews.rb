# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    title { FFaker::Lorem.phrase }
    text { FFaker::Lorem.sentence }
    score { rand(5) }
    book
    user

    trait :approved do
      status { Review.statuses[:approved] }
    end

    trait :rejected do
      status { Review.statuses[:rejected] }
    end

    trait :empty do
      title { '' }
      review { '' }
    end
  end
end
