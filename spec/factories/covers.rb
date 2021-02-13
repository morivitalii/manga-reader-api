FactoryBot.define do
  factory :cover do
    association :content_language
    file { Rack::Test::UploadedFile.new("spec/fixtures/cover.jpg") }
  end
end
