require "rails_helper"

RSpec.describe Api::DeleteTheme do
  describe ".call" do
    it "does what it should" do
      theme = create(:theme)

      service = described_class.new(
        theme: theme
      )

      result = service.call

      expect(result).to be_truthy
    end
  end
end
