FactoryBot.define do
  factory :title do
    title { "Title" }
    description { "Description" }
    publication_status { :ongoing }
  end
end
