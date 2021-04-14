require "rails_helper"

RSpec.describe Api::Titles::UpdateChapter do
  describe ".call" do
    it "does what it should" do
      title = create(:title)
      volume = create(:volume, title: title)
      chapter = create(:chapter, title: title)
      content_language = create(:content_language)
      first_user = create(:user)
      second_user = create(:user)
      ctet_ids = [first_user.id, second_user.id]
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