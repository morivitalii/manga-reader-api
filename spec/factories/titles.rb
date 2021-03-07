FactoryBot.define do
  factory :title do
    title { "Title" }
    description { "Description" }
    status { :draft }
    publication_status { :ongoing }

    trait :draft do
      status { :draft }
    end

    factory :draft_title, traits: [:draft]
  end
end
