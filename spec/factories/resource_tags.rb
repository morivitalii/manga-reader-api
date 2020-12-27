FactoryBot.define do
  factory :resource_tag do
    association :tag
    association :resource, factory: :genre
  end
end
