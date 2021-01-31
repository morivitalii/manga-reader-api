FactoryBot.define do
  factory :resource_translator do
    association :translator
    # TODO title is dummy factory
    association :resource, factory: :title
  end
end
