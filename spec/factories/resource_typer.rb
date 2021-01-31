FactoryBot.define do
  factory :resource_typer do
    association :typer
    # TODO title is dummy factory
    association :resource, factory: :title
  end
end
