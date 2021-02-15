require "rails_helper"

RSpec.describe Api::Titles::Chapters::DeleteCover do
  describe ".call" do
    it "does what it should" do
      title = create(:title)
      chapter = create(:chapter, title: title)
      page = create(:page, chapter: chapter)
      chapter.update!(cover: page)

      service = described_class.new(
        chapter: chapter
      )

      result = service.call

      expect(result).to be_truthy
      expect(chapter.cover).to be_nil
    end
  end
end
