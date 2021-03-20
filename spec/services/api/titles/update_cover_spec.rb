require "rails_helper"

RSpec.describe Api::Titles::UpdateCover do
  describe ".call" do
    it "does what it should" do
      title = create(:title)

      service = described_class.new(
        title: title,
        file: Rack::Test::UploadedFile.new("spec/fixtures/cover.jpg", "image/jpeg")
      )

      result = service.call

      expect(result).to be_truthy
    end
  end
end
