require "rails_helper"

RSpec.describe Api::Users::Views::PagesController do
  describe ".index", context: :as_signed_in_user do
    it "returns valid response" do
      _first_view = create(:page_view, user: current_user)
      second_view = create(:page_view, user: current_user)
      third_view = create(:page_view, user: current_user)
      _other_user_view = create(:page_view)

      params = {}
      pagination_params = {
        page: 1,
        limit: 2
      }

      params.merge!(pagination_params)

      get "/api/users/views/pages.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/users/views/pages_controller/index/200")
      expect(response).to have_objects_collection(third_view.resource, second_view.resource)
    end
  end
end
