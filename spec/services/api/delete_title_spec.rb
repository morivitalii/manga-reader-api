require "rails_helper"

RSpec.describe Api::DeleteTitle do
  describe ".call" do
    it "does what it should" do
      title = create(:title)

      service = described_class.new(
        title: title
      )

      result = service.call

      expect(result).to be_truthy
      expect(title.deleted_at).to be_present
    end
  end
end
