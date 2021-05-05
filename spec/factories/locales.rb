FactoryBot.define do
  factory :locale do
    key { Faker::Alphanumeric.alpha(number: 2) }

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
