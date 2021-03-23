require "rails_helper"

RSpec.describe Api::Users::Chapters::FilterViews do
  describe ".call" do
    it "does what it should" do
      _first_view = create(:chapter_view)
      second_view = create(:chapter_view)
      third_view = create(:chapter_view)

      service = described_class.new(
        scope: View.all,
        filter: {
          ids: [
            second_view.resource_id,
            third_view.resource_id
          ]
        }
      )

      result = service.call

      expect(result).to be_truthy
      expect(service.views).to eq([second_view, third_view])
    end
  end
end
