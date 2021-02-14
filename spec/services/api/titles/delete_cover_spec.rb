require "rails_helper"

RSpec.describe Api::Titles::DeleteCover do
  describe ".call" do
    it "does what it should" do
      cover = create(:cover)

      service = described_class.new(
        cover: cover
      )

      result = service.call

      expect(result).to be_truthy
      expect(Cover.count).to eq(0)
    end
  end
end
