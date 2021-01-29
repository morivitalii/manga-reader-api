FactoryBot.define do
  factory :resource_theme do
    association :theme
    association :resource, factory: :title
  end
end