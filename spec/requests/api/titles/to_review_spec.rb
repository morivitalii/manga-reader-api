require "rails_helper"

RSpec.describe Api::Titles::ToReviewController do
  describe ".update", context: :as_signed_in_user do
    it "returns valid response" do
      title = create(:draft_title)

      put "/api/titles/#{title.to_param}/to_review.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles/to_review_controller/update/200")
    end
  end
end
