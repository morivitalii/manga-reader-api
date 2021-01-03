FactoryBot.define do
  factory :user do
    sequence(:username) { |i| "user#{i}" }
    sequence(:email) { |i| "user#{i}@example.com" }
    password { "password" }
  end
end
