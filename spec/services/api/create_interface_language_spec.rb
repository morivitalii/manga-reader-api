require "rails_helper"

RSpec.describe Api::CreateInterfaceLanguage do
	describe ".call" do
		it "does what it should" do
			locale = create(:locale)
			service = described_class.new(
				locale_id: locale.id,
				title: "Title"
			)

			expect { service.call }.to change { InterfaceLanguage.count }.by(1)
		end
	end
end
