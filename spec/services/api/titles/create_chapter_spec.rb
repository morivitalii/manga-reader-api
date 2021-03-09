require "rails_helper"

RSpec.describe Api::Titles::CreateChapter do
  describe ".call" do
    it "does what it should" do
      title = create(:title)
      volume = create(:volume, title: title)
      group = create(:group)
      user = create(:user)
      _group_user = create(:group_user, group: group, user: user)

      service = described_class.new(
        number: 1,
        name: "Title",
        title: title,
        user: user,
        volume_id: volume.id,
        group_id: group.id
      )

      result = service.call

      expect(result).to be_truthy
      expect(service.chapter.status).to eq("draft")
      expect(title.chapters.count).to eq(1)
    end
  end
end