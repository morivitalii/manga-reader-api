require "rails_helper"

RSpec.describe Api::UpdateMark do
  describe ".call" do
    it "does what it should" do
      mark = create(:mark)

      service = described_class.new(
        mark: mark,
        key: "key",
        title: "Title",
        description: "Description"
      )

      result = service.call

      expect(result).to be_truthy
    end
  end
end
