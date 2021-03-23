require "rails_helper"

RSpec.describe Api::Users::Chapters::ViewsController do
  describe ".index", context: :as_signed_in_user do
    it "returns valid response" do
      _first_view = create(:chapter_view, user: current_user)
      second_view = create(:chapter_view, user: current_user)
      third_view = create(:chapter_view, user: current_user)

      params = {
        filter: {
          ids: [second_view.resource_id, third_view.resource_id]
        }
      }

      get "/api/users/chapters/views.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/users/chapters/views_controller/index/200")
      expect(response).to have_objects_collection(second_view, third_view)
    end
  end
end
