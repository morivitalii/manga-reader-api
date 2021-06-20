require "rails_helper"

RSpec.describe Api::Books::DeleteCover do
  describe ".call" do
    it "does what it should" do
      book = create(:book)

      service = described_class.new(
        book: book
      )

      result = service.call

      expect(result).to be_truthy
    end
  end
end
