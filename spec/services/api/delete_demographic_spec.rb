require "rails_helper"

RSpec.describe Api::DeleteDemographic do
  describe ".call" do
    it "does what it should" do
      demographic = create(:demographic)

      service = described_class.new(
        demographic: demographic
      )

      result = service.call

      expect(result).to be_truthy
    end
  end
end
