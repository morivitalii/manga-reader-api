require "rails_helper"

RSpec.describe Api::Titles::DeleteCover do
  describe ".call" do
    it "does what it should" do
      title = create(:title)

      service = described_class.new(
        title: title
      )

      result = service.call

      expect(result).to be_truthy
    end
  end
end
