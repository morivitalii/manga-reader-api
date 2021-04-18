FactoryBot.define do
  factory :resource_writer do
    association :writer
    association :resource, factory: :chapter
  end
end
