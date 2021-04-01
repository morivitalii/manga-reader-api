FactoryBot.define do
  factory :group_user do
    association :group
    association :user

    factory :group_user_with_manage_group_access_right do
      after(:create) do |object|
        group_access_right = create(:manage_group_access_right)
        create(:group_user_access_right, group_user: object, group_access_right: group_access_right)
      end
    end

    factory :group_user_with_manage_users_access_right do
      after(:create) do |object|
        group_access_right = create(:manage_users_group_access_right)
        create(:group_user_access_right, group_user: object, group_access_right: group_access_right)
      end
    end

    factory :group_user_with_manage_chapters_group_access_right do
      after(:create) do |object|
        group_access_right = create(:manage_chapters_group_access_right)
        create(:group_user_access_right, group_user: object, group_access_right: group_access_right)
      end
    end
  end
end
