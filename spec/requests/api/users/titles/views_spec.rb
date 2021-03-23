require "rails_helper"

RSpec.describe Api::Users::Titles::ViewsController do
  describe ".index", context: :as_signed_in_user do
    it "returns valid response" do
      _first_view = create(:title_view, user: current_user)
      second_view = create(:title_view, user: current_user)
      third_view = create(:title_view, user: current_user)

      params = {
        filter: {
          ids: [second_view.resource_id, third_view.resource_id]
        }
      }

      get "/api/users/titles/views.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/users/titles/views_controller/index/200")
      expect(response).to have_objects_collection(second_view, third_view)
    end
  end
end
