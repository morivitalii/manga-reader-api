FactoryBot.define do
  factory :locale do
    key { Faker::Alphanumeric.unique.alpha(number: 2) }
  end
end
