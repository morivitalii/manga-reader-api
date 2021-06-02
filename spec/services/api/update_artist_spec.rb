require "rails_helper"

RSpec.describe Api::UpdateArtist do
	describe ".call" do
		it "does what it should" do
			artist = create(:artist)
			user = create(:user)

			service = described_class.new(
				artist: artist,
				user_id: user.id,
				name: "Name",
			)

			result = service.call

			expect(result).to be_truthy
		end
	end
end
