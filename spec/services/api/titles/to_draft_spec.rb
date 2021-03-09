require "rails_helper"

RSpec.describe Api::Titles::ToDraft do
  describe ".call" do
    it "does what it should" do
      title = create(:review_title)

      service = described_class.new(
        title: title
      )

      service.call

      expect(title.status).to eq("draft")
    end
  end
end
