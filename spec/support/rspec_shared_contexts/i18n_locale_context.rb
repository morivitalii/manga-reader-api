RSpec.shared_context "I18n locale context" do
  around(:example) do |example|
    # Use english locale for specs
    I18n.with_locale(:en, &example)
  end
end

RSpec.configure do |config|
  config.include_context "I18n locale context"
end
