FactoryBot.define do
  factory :group_user_access_right do
    association :group_access_right
    association :group_user
  end
end
