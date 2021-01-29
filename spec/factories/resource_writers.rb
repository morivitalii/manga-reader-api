FactoryBot.define do
  factory :resource_writer do
    association :artist
    association :resource, factory: :title
  end
end
