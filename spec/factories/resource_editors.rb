FactoryBot.define do
  factory :resource_editor do
    association :editor
    association :resource, factory: :page
  end
end
