require "rails_helper"

RSpec.describe Api::Titles::DeleteTitleCover do
  describe ".call" do
    it "does what it should" do
      title = create(:title)
      cover = create(:resource_cover, resource: title).cover
      title.update!(cover: cover)

      service = described_class.new(
        title: title
      )

      result = service.call

      expect(result).to be_truthy
      expect(title.cover).to be_nil
    end
  end
end
