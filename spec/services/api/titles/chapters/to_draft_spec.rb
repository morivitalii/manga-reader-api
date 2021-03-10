require "rails_helper"

RSpec.describe Api::Titles::Chapters::ToDraft do
  describe ".call" do
    it "does what it should" do
      chapter = create(:review_chapter)

      service = described_class.new(
        chapter: chapter
      )

      service.call

      expect(chapter.status).to eq("draft")
    end
  end
end
