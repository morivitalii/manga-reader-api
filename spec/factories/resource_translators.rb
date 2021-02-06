FactoryBot.define do
  factory :resource_translator do
    association :translator
    association :resource, factory: :page
  end
end
