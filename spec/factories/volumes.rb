FactoryBot.define do
  factory :volume do
    association :book
    sequence(:number, 1) { |i| i }
  end
end
