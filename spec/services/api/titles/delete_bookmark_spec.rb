require "rails_helper"

RSpec.describe Api::Titles::DeleteBookmark do
  describe ".call" do
    it "does what it should" do
      title = create(:title)
      bookmark = create(:bookmark, resource: title)

      service = described_class.new(
        bookmark: bookmark
      )

      service.call

      expect(title.bookmarks.count).to eq(0)
    end
  end
end
