RSpec.shared_context "Current content languages context" do
  around(:example) do |example|
    # Use english and russian as current content languages for specs
    content_languages = [english_content_language, russian_content_language]

    Current.set(content_languages: content_languages) do
      example.run
    end
  end
end

RSpec.configure do |config|
  config.include_context "Current content languages context"
end
