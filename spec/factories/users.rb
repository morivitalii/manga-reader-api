FactoryBot.define do
  factory :user do
    sequence(:username) { |i| "user#{i}" }
    sequence(:email) { |i| "user#{i}@example.com" }
    password { "password" }

    factory :user_with_manage_system_settings_access_right do
      after(:create) do |object|
        access_right = create(:manage_system_settings_access_right)
        create(:user_access_right, user: object, access_right: access_right)
      end
    end

    factory :user_with_manage_system_content_access_right do
      after(:create) do |object|
        access_right = create(:manage_system_content_access_right)
        create(:user_access_right, user: object, access_right: access_right)
      end
    end

    factory :user_with_manage_titles_access_right do
      after(:create) do |object|
        access_right = create(:manage_titles_access_right)
        create(:user_access_right, user: object, access_right: access_right)
      end
    end
  end
end
