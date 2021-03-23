require "rails_helper"

RSpec.describe Api::Users::Chapters::FilterBookmarks do
  describe ".call" do
    it "does what it should" do
      _first_bookmark = create(:chapter_bookmark)
      second_bookmark = create(:chapter_bookmark)
      third_bookmark = create(:chapter_bookmark)

      service = described_class.new(
        scope: Bookmark.all,
        filter: {
          ids: [
            second_bookmark.resource_id,
            third_bookmark.resource_id
          ]
        }
      )

      result = service.call

      expect(result).to be_truthy
      expect(service.bookmarks).to eq([second_bookmark, third_bookmark])
    end
  end
end
