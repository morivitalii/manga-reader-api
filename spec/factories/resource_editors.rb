FactoryBot.define do
  factory :resource_editor do
    association :editor
    # TODO title is dummy factory
    association :resource, factory: :title
  end
end
