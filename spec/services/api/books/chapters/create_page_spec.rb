require "rails_helper"

RSpec.describe Api::Books::Chapters::CreatePage do
  describe ".call" do
    it "does what it should" do
      book = create(:book)
      group = create(:group)
      user = create(:user)
      _group_user = create(:group_user, group: group, user: user)
      chapter = create(:chapter, book: book, group: group)

      service = described_class.new(
        chapter: chapter,
        user: user,
        number: 1,
        file: Rack::Test::UploadedFile.new("spec/fixtures/page.jpg")
      )

      result = service.call

      expect(result).to be_truthy
      expect(service.chapter.status).to eq("draft")
      expect(book.chapters.count).to eq(1)
    end
  end
end
