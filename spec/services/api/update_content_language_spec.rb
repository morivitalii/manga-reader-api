require "rails_helper"

RSpec.describe Api::UpdateContentLanguage do
  describe ".call" do
    it "does what it should" do
      content_language = create(:content_language)

      service = described_class.new(
        content_language: content_language,
        title: "Title",
      )

      result = service.call

      expect(result).to be_truthy
    end
  end
end
