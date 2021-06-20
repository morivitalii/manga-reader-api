require "rails_helper"

RSpec.describe Api::Books::DeleteVolume do
	describe ".call" do
		it "does what it should" do
			volume = create(:volume)

			service = described_class.new(
				volume: volume
			)

			result = service.call

			expect(result).to be_truthy
			expect(Volume.count).to eq(0)
		end
	end
end
