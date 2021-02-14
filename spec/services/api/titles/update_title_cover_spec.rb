require "rails_helper"

RSpec.describe Api::Titles::UpdateTitleCover do
  describe ".call" do
    it "does what it should" do
      title = create(:title)
      cover = create(:resource_cover, resource: title).cover

      service = described_class.new(
        title: title,
        cover_id: cover.id
      )

      result = service.call

      expect(result).to be_truthy
      expect(title.cover).to eq(cover)
    end
  end
end
