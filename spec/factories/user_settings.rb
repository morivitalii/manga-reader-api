FactoryBot.define do
  factory :user_setting do
    association :user
    association :interface_language
    name { "Name" }
    surname { "Surname" }
    sex { :other }
  end
end
