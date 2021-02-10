require "rails_helper"

RSpec.describe Api::Titles::ChaptersController do
  describe ".index" do
    it "returns valid response" do
      title = create(:title)
      first_chapter = create(:chapter, title: title, number: 1)
      third_chapter = create(:chapter, title: title, number: 3)
      second_chapter = create(:chapter, title: title, number: 2)
      other_title = create(:title)
      _other_title_chapter = create(:chapter, title: other_title)

      get "/api/titles/#{title.to_param}/chapters.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles/chapters_controller/index/200")
      expect(response).to have_objects_collection(first_chapter, second_chapter, third_chapter)
    end
  end

  describe ".show" do
    it "returns valid response" do
      title = create(:title)
      chapter = create(:chapter, title: title)

      get "/api/titles/#{title.to_param}/chapters/#{chapter.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles/chapters_controller/show/200")
    end
  end
end
