FactoryBot.define do
  factory :user_content_language do
    association :user
    association :content_language
  end
end
