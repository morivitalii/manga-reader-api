require "rails_helper"

RSpec.describe Api::Titles::Chapters::ToDraftController do
  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      title = create(:title)
      chapter = create(:review_chapter, title: title)

      put "/api/titles/#{title.to_param}/chapters/#{chapter.to_param}/to_draft.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles/chapters/to_draft_controller/update/200")
    end
  end
end
