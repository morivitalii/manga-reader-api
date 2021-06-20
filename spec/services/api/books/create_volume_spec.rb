require "rails_helper"

RSpec.describe Api::Books::CreateVolume do
	describe ".call" do
		it "does what it should" do
			book = create(:book)

			service = described_class.new(
				book: book,
				number: 1
			)

			result = service.call

			expect(result).to be_truthy
			expect(book.volumes.count).to eq(1)
		end
	end
end
