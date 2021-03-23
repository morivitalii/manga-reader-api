FactoryBot.define do
  factory :bookmark do
    association :user
    association :resource, factory: :title

    trait :title do
      association :resource, factory: :title
    end

    trait :chapter do
      association :resource, factory: :chapter
    end

    trait :page do
      association :resource, factory: :page
    end

    factory :title_bookmark, traits: [:title]
    factory :chapter_bookmark, traits: [:chapter]
    factory :page_bookmark, traits: [:page]
  end
end