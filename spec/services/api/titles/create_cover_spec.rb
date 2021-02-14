require "rails_helper"

RSpec.describe Api::Titles::CreateCover do
  describe ".call" do
    it "does what it should" do
      content_language = create(:content_language)
      title = create(:title)

      service = described_class.new(
        title: title,
        content_language_id: content_language.id,
        file: Rack::Test::UploadedFile.new("spec/fixtures/page.jpg")
      )

      result = service.call

      expect(result).to be_truthy
      expect(Cover.count).to eq(1)
      expect(title.covers.count).to eq(1)
    end
  end
end
