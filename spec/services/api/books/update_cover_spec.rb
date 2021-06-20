require "rails_helper"

RSpec.describe Api::Books::UpdateCover do
  describe ".call" do
    it "does what it should" do
      book = create(:book)

      service = described_class.new(
        book: book,
        file: Rack::Test::UploadedFile.new("spec/fixtures/cover.jpg", "image/jpeg")
      )

      result = service.call

      expect(result).to be_truthy
    end
  end
end
