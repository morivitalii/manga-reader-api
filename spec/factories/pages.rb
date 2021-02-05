FactoryBot.define do
  factory :page do
    association :chapter
    association :cleaner
    association :translator
    association :editor
    association :typer
    sequence(:number, 1) { |i| i }
  end
end
