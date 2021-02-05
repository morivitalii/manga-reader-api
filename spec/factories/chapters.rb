FactoryBot.define do
  factory :chapter do
    association :title
    association :volume
    association :group
    sequence(:number, 1) { |i| i }
  end
end
