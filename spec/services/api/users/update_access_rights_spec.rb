require "rails_helper"

RSpec.describe Api::Users::UpdateAccessRights do
	describe ".call" do
		it "does what it should" do
			user = create(:user)
			access_rights = create_list(:access_right, 2)

			service = described_class.new(
				user: user,
				access_right_ids: access_rights.map(&:id)
			)

			result = service.call

			expect(result).to be_truthy
			expect(user.access_rights).to eq(access_rights)
		end
	end
end
