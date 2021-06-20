require "rails_helper"

RSpec.describe Api::Books::UpdateVolume do
	describe ".call" do
		it "does what it should" do
			volume = create(:volume)

			service = described_class.new(
				volume: volume,
				number: 1
			)

			result = service.call

			expect(result).to be_truthy
		end
	end
end
