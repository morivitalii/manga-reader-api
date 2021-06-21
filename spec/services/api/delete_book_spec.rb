require "rails_helper"

RSpec.describe Api::DeleteBook do
  describe ".call" do
    it "does what it should" do
      book = create(:book)

      service = described_class.new(
        book: book
      )

      result = service.call

      expect(result).to be_truthy
      expect(book.deleted_at).to be_present
      expect(book.status).to eq("deleted")
    end
  end
end
