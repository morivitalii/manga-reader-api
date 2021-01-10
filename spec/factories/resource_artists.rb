FactoryBot.define do
  factory :resource_artist do
    association :artist
    association :resource, factory: :title
  end
end
