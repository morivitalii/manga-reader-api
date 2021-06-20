FactoryBot.define do
  factory :view do
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

    factory :book_view, traits: [:book]
    factory :chapter_view, traits: [:chapter]
    factory :page_view, traits: [:page]
  end
end