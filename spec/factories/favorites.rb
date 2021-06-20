FactoryBot.define do
  factory :favorite do
    association :user
    association :resource, factory: :book

    trait :book do
      association :resource, factory: :book
    end

    trait :group do
      association :resource, factory: :group
    end

    trait :artist do
      association :resource, factory: :artist
    end

    factory :book_favorite, traits: [:book]
    factory :group_favorite, traits: [:group]
    factory :artist_favorite, traits: [:artist]
  end
end