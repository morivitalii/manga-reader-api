require "rails_helper"

RSpec.describe Api::Titles::Chapters::CoverController do
  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      title = create(:title)
      chapter = create(:chapter, title: title)
      page = create(:page, chapter: chapter)
      chapter.update!(cover: page)

      params = {
        cover_id: page.id,
      }

      put "/api/titles/#{title.to_param}/chapters/#{chapter.to_param}/cover.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles/chapters/cover_controller/update/200")
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      title = create(:title)
      chapter = create(:chapter, title: title)
      page = create(:page, chapter: chapter)
      chapter.update!(cover: page)

      delete "/api/titles/#{title.to_param}/chapters/#{chapter.to_param}/cover.json"

      expect(response).to have_http_status(204)
    end
  end
end
