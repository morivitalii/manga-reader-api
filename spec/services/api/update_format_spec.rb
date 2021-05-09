require "rails_helper"

RSpec.describe Api::UpdateFormat do
  describe ".call" do
    it "does what it should" do
      format = create(:format)

      service = described_class.new(
        format: format,
        key: "key",
        title: "Title",
        description: "Description"
      )

      result = service.call

      expect(result).to be_truthy
    end
  end
end
