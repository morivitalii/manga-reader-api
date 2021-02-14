require "rails_helper"

RSpec.describe Api::Titles::CoverController do
  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      title = create(:title)
      cover = create(:resource_cover, resource: title).cover

      params = {
        cover_id: cover.id,
      }

      put "/api/titles/#{title.to_param}/cover.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles/cover_controller/update/200")
    end
  end
end
