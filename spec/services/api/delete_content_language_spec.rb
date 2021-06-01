require "rails_helper"

RSpec.describe Api::DeleteContentLanguage do
  describe ".call" do
    it "does what it should" do
      content_language = create(:content_language)

      service = described_class.new(
        content_language: content_language
      )

      result = service.call

      expect(result).to be_truthy
    end
  end
end
