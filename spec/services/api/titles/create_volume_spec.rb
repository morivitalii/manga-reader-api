require "rails_helper"

RSpec.describe Api::Titles::CreateVolume do
	describe ".call" do
		it "does what it should" do
			title = create(:title)

			service = described_class.new(
				title: title,
				number: 1
			)

			result = service.call

			expect(result).to be_truthy
			expect(title.volumes.count).to eq(1)
		end
	end
end
