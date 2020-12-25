RSpec.shared_context "English content language context" do
  let!(:english_content_language) do
    ContentLanguage.joins(:locale).where(locales: { key: :en }).take || create(:english_content_language)
  end
end

RSpec.configure do |config|
  config.include_context "English content language context"
end
