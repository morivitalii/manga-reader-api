FactoryBot.define do
  factory :view do
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

    factory :title_view, traits: [:title]
    factory :chapter_view, traits: [:chapter]
    factory :page_view, traits: [:page]
  end
end