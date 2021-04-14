require "rails_helper"

RSpec.describe Api::Titles::Chapters::ToReview do
  describe ".call" do
    it "does what it should" do
      chapter = create(:draft_chapter)

      service = described_class.new(
        chapter: chapter
      )

      service.call

      expect(chapter.status).to eq("review")
      expect(chapter.sent_to_review_at).to be_present
    end
  end
end
