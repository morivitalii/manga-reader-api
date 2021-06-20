FactoryBot.define do
  factory :bookmark do
    association :user
    association :resource, factory: :book

    trait :book do
      association :resource, factory: :book
    end

    trait :chapter do
      association :resource, factory: :chapter
    end

    trait :page do
      association :resource, factory: :page
    end

    factory :book_bookmark, traits: [:book]
    factory :chapter_bookmark, traits: [:chapter]
    factory :page_bookmark, traits: [:page]
  end
end