require "rails_helper"

RSpec.describe Api::DeleteTag do
	describe ".call" do
		it "does what it should" do
			tag = create(:tag)

			service = described_class.new(
				tag: tag
			)

			result = service.call

			expect(result).to be_truthy
		end
	end
end
