FactoryBot.define do
  factory :show do
    title       { Faker::Lorem.words(3).join(' ').titleize }
    description { Faker::Lorem.paragraph }

    transient do
      reviews_count 3
    end

    trait :with_reviews do
      reviews { build_list :review, reviews_count }
    end
  end
end
