require "rails_helper"

RSpec.describe Api::CreateFormat do
  describe ".call" do
    it "does what it should" do
      service = described_class.new(
        key: "key",
        title: "Title",
        description: "Description"
      )

      result = service.call

      expect(result).to be_truthy
      expect(Format.count).to eq(1)
    end
  end
end
