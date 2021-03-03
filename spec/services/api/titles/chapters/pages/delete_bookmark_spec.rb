require "rails_helper"

RSpec.describe Api::Titles::Chapters::Pages::DeleteBookmark do
  describe ".call" do
    it "does what it should" do
      page = create(:page)
      bookmark = create(:bookmark, resource: page)

      service = described_class.new(
        bookmark: bookmark
      )

      service.call

      expect(page.bookmarks.count).to eq(0)
    end
  end
end
