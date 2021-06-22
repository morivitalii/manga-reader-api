RSpec.shared_context "Content and interface languages context" do
  around(:example) do |example|
		primary_locale = Locale.where(key: :ru).take || create(:locale, key: :ru)
    secondary_locale = create(:locale)
		
		primary_content_language = create(:content_language, locale: primary_locale)
		secondary_content_language = create(:content_language, locale: secondary_locale)

    primary_interface_language = create(:interface_language, locale: primary_locale)
    _secondary_content_language = create(:interface_language, locale: secondary_locale)

    current = {
      content_languages: [primary_content_language, secondary_content_language],
      content_language: primary_content_language,
      interface_language: primary_interface_language
    }

    Current.set(current) do
      example.run
    end
  end
end

RSpec.configure do |config|
  config.include_context "Content and interface languages context"
end
