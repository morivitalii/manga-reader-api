require "rails_helper"

RSpec.describe Api::Books::DeleteFavorite do
  describe ".call" do
    it "does what it should" do
      book = create(:book)
      favorite = create(:favorite, resource: book)

      service = described_class.new(
        favorite: favorite
      )

      service.call

      expect(book.favorites.count).to eq(0)
    end
  end
end
