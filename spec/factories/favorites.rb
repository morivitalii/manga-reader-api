FactoryBot.define do
  factory :favorite do
    association :user
    association :resource, factory: :title

    trait :title do
      association :resource, factory: :title
    end

    trait :group do
      association :resource, factory: :group
    end

    trait :artist do
      association :resource, factory: :artist
    end

    factory :title_favorite, traits: [:title]
    factory :group_favorite, traits: [:group]
    factory :artist_favorite, traits: [:artist]
  end
end