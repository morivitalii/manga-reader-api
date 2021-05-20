require "rails_helper"

RSpec.describe Api::UpdateTheme do
  describe ".call" do
    it "does what it should" do
      theme = create(:theme)

      service = described_class.new(
        theme: theme,
        key: "key",
        title: "Title",
        description: "Description"
      )

      result = service.call

      expect(result).to be_truthy
    end
  end
end
