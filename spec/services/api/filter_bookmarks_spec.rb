require "rails_helper"

RSpec.describe Api::FilterBookmarks do
  describe ".call" do
    context "resource type" do
      it "does what it should" do
        first_bookmark = create(:book_bookmark)
        second_bookmark = create(:book_bookmark)
        _third_bookmark = create(:chapter_bookmark)
        _fourth_bookmark = create(:page_bookmark)

        params = Api::Bookmarks::IndexParams.new(resource_type: "Book")

        service = described_class.new(
          scope: Bookmark.all,
          params: params
        )

        result = service.call

        expect(result).to be_truthy
        expect(service.bookmarks).to eq([first_bookmark, second_bookmark])
      end
    end

    context "resource type and ids" do
      it "does what it should" do
        first_bookmark = create(:book_bookmark)
        second_bookmark = create(:book_bookmark)
        _third_bookmark = create(:book_bookmark)
        _fourth_bookmark = create(:chapter_bookmark)
        _fifth_bookmark = create(:page_bookmark)

        params = Api::Bookmarks::IndexParams.new(
          resource_type: "Book",
          resource_ids: [
            first_bookmark.book_id,
            second_bookmark.book_id
          ]
        )

        service = described_class.new(
          scope: Bookmark.all,
          params: params
        )

        result = service.call

        expect(result).to be_truthy
        expect(service.bookmarks).to eq([first_bookmark, second_bookmark])
      end
    end
  end
end
