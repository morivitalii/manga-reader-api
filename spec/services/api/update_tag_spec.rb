require "rails_helper"

RSpec.describe Api::UpdateTag do
	describe ".call" do
		it "does what it should" do
			tag = create(:tag)

			service = described_class.new(
				tag: tag,
				key: "key",
				title: "Title",
				description: "Description"
			)

			result = service.call

			expect(result).to be_truthy
		end
	end
end
