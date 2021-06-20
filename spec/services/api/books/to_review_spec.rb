require "rails_helper"

RSpec.describe Api::Books::ToReview do
  describe ".call" do
    it "does what it should" do
      book = create(:draft_book)

      service = described_class.new(
        book: book
      )

      service.call

      expect(book.status).to eq("review")
      expect(book.sent_to_review_at).to be_present
    end
  end
end
