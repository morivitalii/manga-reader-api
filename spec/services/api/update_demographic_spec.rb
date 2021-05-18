require "rails_helper"

RSpec.describe Api::UpdateDemographic do
  describe ".call" do
    it "does what it should" do
      demographic = create(:demographic)

      service = described_class.new(
        demographic: demographic,
        key: "key",
        title: "Title",
        description: "Description"
      )

      result = service.call

      expect(result).to be_truthy
    end
  end
end
