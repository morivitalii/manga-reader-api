require "rails_helper"

RSpec.describe Api::FilterViews do
  describe ".call" do
    context "resource type" do
      it "does what it should" do
        first_view = create(:title_view)
        second_view = create(:title_view)
        _third_view = create(:chapter_view)
        _fourth_view = create(:page_view)

        params = Api::Views::IndexParams.new(resource_type: "Title")

        service = described_class.new(
          scope: View.all,
          params: params
        )

        result = service.call

        expect(result).to be_truthy
        expect(service.views).to eq([first_view, second_view])
      end
    end

    context "resource type and ids" do
      it "does what it should" do
        first_view = create(:title_view)
        second_view = create(:title_view)
        _third_view = create(:title_view)
        _fourth_view = create(:chapter_view)
        _fifth_view = create(:page_view)

        params = Api::Views::IndexParams.new(
          resource_type: "Title",
          resource_ids: [
            first_view.title_id,
            second_view.title_id
          ]
        )

        service = described_class.new(
          scope: View.all,
          params: params
        )

        result = service.call

        expect(result).to be_truthy
        expect(service.views).to eq([first_view, second_view])
      end
    end
  end
end
