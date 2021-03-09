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

  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      title = create(:title)
      volume = create(:volume, title: title)
      group = create(:group)
      _group_user = create(:group_user, group: group, user: current_user)

      params = {
        volume_id: volume.id,
        group_id: group.id,
        number: 1,
        name: "Title"
      }

      post "/api/titles/#{title.to_param}/chapters.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles/chapters_controller/create/200")
    end
  end
end
