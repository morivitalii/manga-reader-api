FactoryBot.define do
  factory :resource_cleaner do
    association :cleaner
    # TODO title is dummy factory
    association :resource, factory: :title
  end
end
