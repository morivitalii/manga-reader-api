RSpec.shared_context "Current interface language context" do
  around(:example) do |example|
    # Use english as current interface language for specs
    Current.set(content_language: english_interface_language) do
      example.run
    end
  end
end

RSpec.configure do |config|
  config.include_context "Current interface language context"
end
