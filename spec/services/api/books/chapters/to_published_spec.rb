require "rails_helper"

RSpec.describe Api::Books::Chapters::ToPublished do
  describe ".call" do
    it "does what it should" do
      chapter = create(:review_chapter)

      service = described_class.new(
        chapter: chapter
      )

      service.call

      expect(chapter.status).to eq("published")
      expect(chapter.published_at).to be_present
    end
  end
end
