require "rails_helper"

RSpec.describe Api::ViewsController do
  describe ".index", context: :as_signed_in_user do
    it "returns valid response" do
      _first_view = create(:title_view, user: current_user)
      second_view = create(:title_view, user: current_user)
      third_view = create(:chapter_view, user: current_user)
      forth_view = create(:page_view, user: current_user)

      params = {}
      pagination_params = {
        page: 1,
        limit: 3
      }

      params.merge!(pagination_params)

      get "/api/views.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/views_controller/index/200")
      expect(response).to have_objects_collection(forth_view, third_view, second_view)
    end
  end
end
