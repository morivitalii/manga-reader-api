FactoryBot.define do
  factory :group_access_right do
    key { :manage_users }

    trait :manage_users do
      key { :manage_users }
    end

    trait :manage_chapters do
      key { :manage_chapters }
    end

    factory :manage_users_group_access_right, traits: [:manage_users]
    factory :manage_chapters_group_access_right, traits: [:manage_chapters]
  end
end
