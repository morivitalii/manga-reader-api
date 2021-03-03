require "rails_helper"

RSpec.describe Api::Titles::Chapters::CreateBookmark do
  describe ".call" do
    it "does what it should" do
      chapter = create(:chapter)
      user = create(:user)

      service = described_class.new(
        chapter: chapter,
        user: user
      )

      service.call

      expect(chapter.bookmarks.count).to eq(1)
      expect(user.bookmarks.count).to eq(1)
    end
  end
end
