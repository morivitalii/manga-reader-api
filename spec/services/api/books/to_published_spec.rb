require "rails_helper"

RSpec.describe Api::Books::ToPublished do
  describe ".call" do
    it "does what it should" do
      book = create(:review_book)

      service = described_class.new(
        book: book
      )

      service.call

      expect(book.status).to eq("published")
      expect(book.published_at).to be_present
    end
  end
end
