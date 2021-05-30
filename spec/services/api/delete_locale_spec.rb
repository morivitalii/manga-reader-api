require "rails_helper"

RSpec.describe Api::DeleteLocale do
  describe ".call" do
    it "does what it should" do
      locale = create(:locale)

      service = described_class.new(
        locale: locale
      )

      result = service.call

      expect(result).to be_truthy
    end
  end
end
