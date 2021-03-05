FactoryBot.define do
  factory :favorite do
    association :user
    association :resource, factory: :title
  end
end