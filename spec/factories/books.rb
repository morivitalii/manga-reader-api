FactoryBot.define do
  factory :book do
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

    trait :published do
      status { :review }
    end

    factory :draft_book, traits: [:draft]
    factory :review_book, traits: [:review]
    factory :published_book, traits: [:review]
  end
end
