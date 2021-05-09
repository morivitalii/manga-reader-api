require "rails_helper"

RSpec.describe Api::DeleteFormat do
  describe ".call" do
    it "does what it should" do
      format = create(:format)

      service = described_class.new(
        format: format
      )

      result = service.call

      expect(result).to be_truthy
    end
  end
end
