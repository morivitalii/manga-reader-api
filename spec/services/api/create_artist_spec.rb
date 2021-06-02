require "rails_helper"

RSpec.describe Api::CreateArtist do
	describe ".call" do
		it "does what it should" do
			user = create(:user)

			service = described_class.new(
				user_id: user.id,
				name: "Name"
			)

			expect { service.call }.to change { Artist.count }.by(1)
		end
	end
end
