require "rails_helper"

RSpec.describe Api::Titles::Chapters::PagesController do
  describe ".index" do
    it "returns valid response" do
      title = create(:title)
      chapter = create(:chapter, title: title)
      first_page = create(:page, chapter: chapter, number: 1)
      third_page = create(:page, chapter: chapter, number: 3)
      second_page = create(:page, chapter: chapter, number: 2)
      _other_page = create(:page)

      get "/api/titles/#{title.to_param}/chapters/#{chapter.to_param}/pages.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles/chapters/pages_controller/index/200")
      expect(response).to have_objects_collection(first_page, second_page, third_page)
    end
  end

  describe ".show" do
    it "returns valid response" do
      title = create(:title)
      chapter = create(:chapter, title: title)
      page = create(:page, chapter: chapter)

      get "/api/titles/#{title.to_param}/chapters/#{chapter.to_param}/pages/#{page.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles/chapters/pages_controller/show/200")
    end
  end

  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      title = create(:title)
      group = create(:group)
      _group_user = create(:group_user, group: group, user: current_user)
      chapter = create(:chapter, title: title, group: group)

      params = {
        number: 1,
        file: Rack::Test::UploadedFile.new("spec/fixtures/page.jpg")
      }

      post "/api/titles/#{title.to_param}/chapters/#{chapter.to_param}/pages.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles/chapters/pages_controller/create/200")
    end
  end
end
