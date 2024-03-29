FactoryBot.define do
  factory :access_right do
    sequence(:key) { |i| "access_right#{i}" }

    trait :manage_system_settings do
      key { "manage_system_settings" }
		end

    trait :manage_users do
      key { "manage_users" }
    end

    trait :manage_content do
      key { "manage_content" }
    end

    factory :manage_system_settings_access_right, traits: [:manage_system_settings]
    factory :manage_users_access_right, traits: [:manage_users]
    factory :manage_content_access_right, traits: [:manage_content]
  end
end
