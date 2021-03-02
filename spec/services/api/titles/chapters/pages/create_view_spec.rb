require "rails_helper"

RSpec.describe Api::Titles::Chapters::Pages::CreateView do
  describe ".call" do
    it "does what it should" do
      page = create(:page)
      user = create(:user)

      service = described_class.new(
        page: page,
        user: user
      )

      service.call

      expect(page.views.count).to eq(1)
      expect(user.views.count).to eq(1)
    end
  end
end
