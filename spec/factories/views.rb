FactoryBot.define do
  factory :view do
    association :user
    association :resource, factory: :title
  end
end