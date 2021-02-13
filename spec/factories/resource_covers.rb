FactoryBot.define do
  factory :resource_cover do
    association :cover
    association :resource, factory: :title
  end
end