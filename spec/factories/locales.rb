FactoryBot.define do
  factory :locale do
    sequence(:key, 1) { |i| "k#{i}" }

    trait :russian do
      key { "ru" }
    end

    trait :english do
      key { "en" }
    end

    factory :russian_locale, traits: [:russian]
    factory :english_locale, traits: [:english]
  end
end
