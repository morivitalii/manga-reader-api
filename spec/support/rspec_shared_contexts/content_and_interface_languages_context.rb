RSpec.shared_context "Content and interface languages context" do
  around(:example) do |example|
    english_content_language = ContentLanguage.joins(:locale).where(locales: {key: :en}).take || create(:english_content_language)
    russian_content_language = ContentLanguage.joins(:locale).where(locales: {key: :ru}).take || create(:russian_content_language)
    english_interface_language = InterfaceLanguage.joins(:locale).where(locales: {key: :en}).take || create(:english_interface_language)
    _russian_interface_language = InterfaceLanguage.joins(:locale).where(locales: {key: :ru}).take || create(:russian_interface_language)

    current = {
      content_languages: [english_content_language, russian_content_language],
      content_language: english_content_language,
      interface_language: english_interface_language
    }

    Current.set(current) do
      example.run
    end
  end
end

RSpec.configure do |config|
  config.include_context "Content and interface languages context"
end
