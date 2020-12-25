RSpec.shared_context "Current content language context" do
  around(:example) do |example|
    # Use english as current content language for specs
    Current.set(content_language: english_content_language) do
      example.run
    end
  end
end

RSpec.configure do |config|
  config.include_context "Current content language context"
end
