FactoryBot.define do
  factory :interface_language do
    association :locale

    title { "Title" }

    trait :english do
      # Little workaround to overcome locale uniqueness restriction
      locale { Locale.where(key: :en).take || create(:english_locale) }
    end

    trait :russian do
      # Little workaround to overcome locale uniqueness restriction
      locale { Locale.where(key: :ru).take || create(:russian_locale) }
    end

    factory :english_interface_language, traits: [:english]
    factory :russian_interface_language, traits: [:russian]
  end
end
