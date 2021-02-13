FactoryBot.define do
  factory :page do
    association :chapter
    association :cleaner
    association :translator
    association :editor
    association :typer
    file { Rack::Test::UploadedFile.new("spec/fixtures/page.jpg") }
    sequence(:number, 1) { |i| i }
  end
end
