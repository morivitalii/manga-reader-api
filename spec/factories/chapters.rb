FactoryBot.define do
  factory :chapter do
    association :title
    association :group
    association :user

    volume do
      create(:volume, title: title)
    end

    before(:create) do |object|
      create(:group_user, group: object.group, user: object.user)
    end

    sequence(:number, 1) { |i| i }
    name { "Title" }
    status { :draft }

    trait :draft do
      status { :draft }
    end

    factory :draft_chapter, traits: [:draft]
  end
end
