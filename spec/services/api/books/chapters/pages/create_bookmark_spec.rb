require "rails_helper"

RSpec.describe Api::Books::Chapters::Pages::CreateBookmark do
  describe ".call" do
    it "does what it should" do
      page = create(:page)
      user = create(:user)

      service = described_class.new(
        page: page,
        user: user
      )

      service.call

      expect(page.bookmarks.count).to eq(1)
      expect(user.bookmarks.count).to eq(1)
    end
  end
end
