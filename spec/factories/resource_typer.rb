FactoryBot.define do
  factory :resource_typer do
    association :typer
    association :resource, factory: :page
  end
end
