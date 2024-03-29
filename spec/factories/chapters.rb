FactoryBot.define do
  factory :chapter do
    association :content_language
    association :book
    association :group
    association :user

    before(:create) do |object|
      create(:group_user, group: object.group, user: object.user)
    end

    sequence(:volume, 1) { |i| i }
    sequence(:number, 1) { |i| i }
		title { "Title" }
    status { :draft }

    trait :draft do
      status { :draft }
    end

    trait :review do
      status { :review }
    end

    trait :published do
      status { :review }
    end

    factory :draft_chapter, traits: [:draft]
    factory :review_chapter, traits: [:review]
    factory :published_chapter, traits: [:review]
  end
end
