require "rails_helper"

RSpec.describe Api::Books::CreateBookmark do
  describe ".call" do
    it "does what it should" do
      book = create(:book)
      user = create(:user)

      service = described_class.new(
        book: book,
        user: user
      )

      service.call

      expect(book.bookmarks.count).to eq(1)
      expect(user.bookmarks.count).to eq(1)
    end
  end
end
