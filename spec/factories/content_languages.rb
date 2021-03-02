FactoryBot.define do
  factory :content_language do
    association :locale

    # Because content language model refers to itself this additional operations must be done
    to_create do |evaluation|
      evaluation.save(validate: false)
      evaluation.translations.update_all(content_language_id: evaluation.id)
    end

    trait :english do
      # Little workaround to overcome locale uniqueness restriction
      locale { Locale.where(key: :en).take || create(:english_locale) }
    end

    trait :russian do
      # Little workaround to overcome locale uniqueness restriction
      locale { Locale.where(key: :ru).take || create(:russian_locale) }
    end

    factory :english_content_language, traits: [:english]
    factory :russian_content_language, traits: [:russian]
  end
end
