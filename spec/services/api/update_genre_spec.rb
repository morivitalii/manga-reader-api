require "rails_helper"

RSpec.describe Api::UpdateGenre do
  describe ".call" do
    it "does what it should" do
      genre = create(:genre)

      service = described_class.new(
        genre: genre,
        key: "key",
        title: "Title",
        description: "Description"
      )

      result = service.call

      expect(result).to be_truthy
    end
  end
end
