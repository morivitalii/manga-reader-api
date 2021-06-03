FactoryBot.define do
  factory :access_right do
    sequence(:key) { |i| "access_right#{i}" }

    trait :manage_system_settings do
      key { "manage_system_settings" }
		end

    trait :manage_users do
      key { "manage_users" }
    end

    trait :manage_titles do
      key { "manage_titles" }
    end

    factory :manage_system_settings_access_right, traits: [:manage_system_settings]
    factory :manage_users_access_right, traits: [:manage_users]
    factory :manage_titles_access_right, traits: [:manage_titles]
  end
end
