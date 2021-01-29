FactoryBot.define do
  factory :resource_painter do
    association :painter
    association :resource, factory: :title
  end
end
