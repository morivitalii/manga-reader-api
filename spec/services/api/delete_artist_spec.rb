require "rails_helper"

RSpec.describe Api::DeleteArtist do
	describe ".call" do
		it "does what it should" do
			artist = create(:artist)

			service = described_class.new(
				artist: artist
			)

			result = service.call

			expect(result).to be_truthy
		end
	end
end
