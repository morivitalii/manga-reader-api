FactoryBot.define do
  factory :cover do
    content_language { ContentLanguage.joins(:locale).where(locales: {key: :en}).take }
    file { Rack::Test::UploadedFile.new("spec/fixtures/cover.jpg") }
  end
end
