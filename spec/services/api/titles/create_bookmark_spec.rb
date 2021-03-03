require "rails_helper"

RSpec.describe Api::Titles::CreateBookmark do
  describe ".call" do
    it "does what it should" do
      title = create(:title)
      user = create(:user)

      service = described_class.new(
        title: title,
        user: user
      )

      service.call

      expect(title.bookmarks.count).to eq(1)
      expect(user.bookmarks.count).to eq(1)
    end
  end
end
