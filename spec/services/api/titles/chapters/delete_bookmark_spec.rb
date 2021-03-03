require "rails_helper"

RSpec.describe Api::Titles::Chapters::DeleteBookmark do
  describe ".call" do
    it "does what it should" do
      chapter = create(:chapter)
      bookmark = create(:bookmark, resource: chapter)

      service = described_class.new(
        bookmark: bookmark
      )

      service.call

      expect(chapter.bookmarks.count).to eq(0)
    end
  end
end
