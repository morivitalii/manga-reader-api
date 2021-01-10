FactoryBot.define do
  factory :artist do
    association :user
    name { "Name" }
  end
end
