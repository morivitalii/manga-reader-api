FactoryBot.define do
  factory :resource_format do
    association :format
    association :resource, factory: :title
  end
end