require "rails_helper"

RSpec.describe Api::DeleteMark do
  describe ".call" do
    it "does what it should" do
      mark = create(:mark)

      service = described_class.new(
        mark: mark
      )

      result = service.call

      expect(result).to be_truthy
    end
  end
end
