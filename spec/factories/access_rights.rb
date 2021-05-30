FactoryBot.define do
  factory :access_right do
    key { "manage_titles" }

    trait :manage_system_settings do
      key { "manage_system_settings" }
    end

    trait :manage_titles do
      key { "manage_titles" }
    end

    factory :manage_system_settings_access_right, traits: [:manage_system_settings]
    factory :manage_titles_access_right, traits: [:manage_titles]
  end
end
