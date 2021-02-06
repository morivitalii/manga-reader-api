FactoryBot.define do
  factory :resource_cleaner do
    association :cleaner
    association :resource, factory: :page
  end
end
