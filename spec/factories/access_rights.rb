FactoryBot.define do
  factory :access_right do
    key { "manage_titles" }

    trait :manage_titles do
      key { "manage_titles" }
    end

    factory :manage_titles_access_right, traits: [:manage_titles]
  end
end
