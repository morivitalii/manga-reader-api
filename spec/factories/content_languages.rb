FactoryBot.define do
  factory :content_language do
    association :locale

    # Because content language model refers to itself this additional operations must be done
    to_create do |evaluation|
      evaluation.save(validate: false)
      evaluation.translations.update_all(content_language_id: evaluation.id)
    end
  end
end
