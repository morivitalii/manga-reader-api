FactoryBot.define do
  factory :user_access_right do
    association :user
    association :access_right
  end
end
