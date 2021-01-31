FactoryBot.define do
  factory :volume do
    association :title
    sequence(:number, 1) { |i| i }
  end
end
