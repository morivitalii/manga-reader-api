FactoryBot.define do
  factory :resource_demographic do
    association :demographic
    association :resource, factory: :title
  end
end