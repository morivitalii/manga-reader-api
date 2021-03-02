require "rails_helper"

RSpec.describe Api::Titles::Chapters::CreateView do
  describe ".call" do
    it "does what it should" do
      chapter = create(:chapter)
      user = create(:user)

      service = described_class.new(
        chapter: chapter,
        user: user
      )

      service.call

      expect(chapter.views.count).to eq(1)
      expect(user.views.count).to eq(1)
    end
  end
end
