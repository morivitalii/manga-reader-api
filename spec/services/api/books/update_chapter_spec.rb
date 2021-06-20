require "rails_helper"

RSpec.describe Api::Books::UpdateChapter do
  describe ".call" do
    it "does what it should" do
      book = create(:book)
      volume = create(:volume, book: book)
      chapter = create(:chapter, book: book)
      content_language = create(:content_language)
      first_user = create(:user)
      first_artist = create(:artist, user: first_user)
      second_user = create(:user)
      second_artist = create(:artist, user: second_user)
      ctet_ids = [first_artist.id, second_artist.id]
      _group_user = create(:group_user, user: first_user)
      _group_user = create(:group_user, user: second_user)

      service = described_class.new(
        chapter: chapter,
        number: 1,
        name: "Title",
        content_language_id: content_language.id,
        volume_id: volume.id,
        cleaner_ids: ctet_ids,
        translator_ids: ctet_ids,
        editor_ids: ctet_ids,
        typer_ids: ctet_ids
      )

      result = service.call

      expect(result).to be_truthy
    end
  end
end
