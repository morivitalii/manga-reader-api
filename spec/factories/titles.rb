FactoryBot.define do
  factory :title do
    title { "Title" }
    description { "Description" }
    status { :draft }
    publication_status { :ongoing }
  end
end
