FactoryBot.define do
  factory :access_right do
    sequence(:key, 1) { |i| i }
  end
end
