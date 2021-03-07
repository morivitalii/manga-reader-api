require "rails_helper"

RSpec.describe Api::Titles::ToReview do
  describe ".call" do
    it "does what it should" do
      title = create(:draft_title)

      service = described_class.new(
        title: title
      )

      service.call

      expect(title.status).to eq("review")
    end
  end
end
