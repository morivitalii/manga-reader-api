require "rails_helper"

RSpec.describe Api::Titles::DeleteChapter do
  describe ".call" do
    it "does what it should" do
      chapter = create(:chapter)
      _pages = create_list(:page, 2, chapter: chapter)

      service = described_class.new(
        chapter: chapter
      )

      result = service.call

      expect(result).to be_truthy
      expect(chapter.deleted_at).to be_present
    end
  end
end
