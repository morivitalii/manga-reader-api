FactoryBot.define do
  factory :chapter do
    association :title
    association :group
    association :user

    volume do
      create(:volume, title: title)
    end

    sequence(:number, 1) { |i| i }
    name { "Title" }
    status { :draft }
  end
end
