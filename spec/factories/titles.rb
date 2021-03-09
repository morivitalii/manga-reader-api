FactoryBot.define do
  factory :title do
    title { "Title" }
    description { "Description" }
    status { :draft }
    publication_status { :ongoing }

    trait :draft do
      status { :draft }
    end

    trait :review do
      status { :review }
    end

    factory :draft_title, traits: [:draft]
    factory :review_title, traits: [:review]
  end
end
