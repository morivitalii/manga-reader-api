require "rails_helper"

RSpec.describe Api::Books::DeleteBookmark do
  describe ".call" do
    it "does what it should" do
      book = create(:book)
      bookmark = create(:bookmark, resource: book)

      service = described_class.new(
        bookmark: bookmark
      )

      service.call

      expect(book.bookmarks.count).to eq(0)
    end
  end
end
