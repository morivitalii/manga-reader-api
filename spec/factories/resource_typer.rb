FactoryBot.define do
  factory :resource_typer do
    association :typer
    association :resource, factory: :chapter
  end
end
