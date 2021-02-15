require "rails_helper"

RSpec.describe Api::Titles::Chapters::UpdateCover do
  describe ".call" do
    it "does what it should" do
      title = create(:title)
      chapter = create(:chapter, title: title)
      page = create(:page, chapter: chapter)

      service = described_class.new(
        chapter: chapter,
        cover_id: page.id
      )

      result = service.call

      expect(result).to be_truthy
      expect(chapter.cover).to eq(page)
    end
  end
end
