RSpec.shared_context "English interface language context" do
  let!(:english_interface_language) do
    InterfaceLanguage.joins(:locale).where(locales: { key: :en }).take || create(:english_interface_language)
  end
end

RSpec.configure do |config|
  config.include_context "English interface language context"
end
