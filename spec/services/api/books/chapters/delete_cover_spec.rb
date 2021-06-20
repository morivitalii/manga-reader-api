require "rails_helper"

RSpec.describe Api::Books::Chapters::DeleteCover do
  describe ".call" do
    it "does what it should" do
      book = create(:book)
      chapter = create(:chapter, book: book)

      service = described_class.new(
        chapter: chapter
      )

      result = service.call

      expect(result).to be_truthy
    end
  end
end
