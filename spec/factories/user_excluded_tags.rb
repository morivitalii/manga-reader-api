FactoryBot.define do
  factory :user_excluded_tag do
    association :user
    association :tag
  end
end
