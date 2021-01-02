RSpec.shared_context "Russian interface language context" do
  let!(:russian_interface_language) do
    InterfaceLanguage.joins(:locale).where(locales: {key: :ru}).take || create(:russian_interface_language)
  end
end

RSpec.configure do |config|
  config.include_context "Russian interface language context"
end
