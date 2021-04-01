require "rails_helper"

RSpec.describe Api::UpdateGroup do
  describe ".call" do
    it "does what it should" do
      group = create(:group)

      service = described_class.new(
        group: group,
        title: "Title"
      )

      result = service.call

      expect(result).to be_truthy
    end
  end
end
