require "rails_helper"

RSpec.describe Api::Books::Chapters::UpdateCover do
  describe ".call" do
    it "does what it should" do
      book = create(:book)
      chapter = create(:chapter, book: book)

      service = described_class.new(
        chapter: chapter,
        file: Rack::Test::UploadedFile.new("spec/fixtures/cover.jpg")
      )

      result = service.call

      expect(result).to be_truthy
    end
  end
end
