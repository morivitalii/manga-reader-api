FactoryBot.define do
  factory :resource_editor do
    association :editor
    association :resource, factory: :chapter
  end
end
