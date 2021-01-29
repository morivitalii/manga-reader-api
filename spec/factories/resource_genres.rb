FactoryBot.define do
  factory :resource_genre do
    association :genre
    association :resource, factory: :title
  end
end