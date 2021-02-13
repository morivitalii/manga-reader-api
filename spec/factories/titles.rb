FactoryBot.define do
  factory :title do
    association :cover
    title { "Title" }
    description { "Description" }

    after(:build) do |object|
      object.covers << object.cover
    end
  end
end
