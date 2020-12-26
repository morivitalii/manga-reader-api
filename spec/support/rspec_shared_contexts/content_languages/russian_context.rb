RSpec.shared_context "Russian content language context" do
  let!(:russian_content_language) do
    ContentLanguage.joins(:locale).where(locales: { key: :ru }).take || create(:russian_content_language)
  end
end

RSpec.configure do |config|
  config.include_context "Russian content language context"
end
