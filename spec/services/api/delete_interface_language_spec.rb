require "rails_helper"

RSpec.describe Api::DeleteInterfaceLanguage do
	describe ".call" do
		it "does what it should" do
			interface_language = create(:interface_language)

			service = described_class.new(
				interface_language: interface_language
			)

			result = service.call

			expect(result).to be_truthy
		end
	end
end
