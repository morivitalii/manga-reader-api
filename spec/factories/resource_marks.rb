FactoryBot.define do
  factory :resource_mark do
    association :mark
    association :resource, factory: :title
  end
end