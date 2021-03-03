FactoryBot.define do
  factory :bookmark do
    association :user
    association :resource, factory: :title
  end
end