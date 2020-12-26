FactoryBot.define do
  factory :tag do
    title { "Title" }
    sequence(:key) { |i| "key #{i}" }
  end
end
