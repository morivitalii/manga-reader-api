require "rails_helper"

RSpec.describe Api::Titles::ViewsController do
  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      title = create(:title)

      post "/api/titles/#{title.to_param}/views.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles/views_controller/create/200")
    end
  end
end
