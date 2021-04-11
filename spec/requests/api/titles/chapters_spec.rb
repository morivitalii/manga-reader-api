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
      content_language = create(:content_language)
      title = create(:title)
      volume = create(:volume, title: title)
      group = create(:group)
      first_user = create(:user)
      second_user = create(:user)
      ctet_ids = [first_user.id, second_user.id]
      _group_user = create(:group_user, group: group, user: first_user)
      _group_user = create(:group_user, group: group, user: second_user)
      _group_user = create(:group_user_with_manage_chapters_access_right, group: group, user: current_user)

      params = {
        content_language_id: content_language.id,
        volume_id: volume.id,
        group_id: group.id,
        number: 1,
        name: "Title",
        cleaner_ids: ctet_ids,
        translator_ids: ctet_ids,
        editor_ids: ctet_ids,
        typer_ids: ctet_ids
      }

      post "/api/titles/#{title.to_param}/chapters.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles/chapters_controller/create/200")
    end
  end

  describe ".update", context: :as_signed_in_user do
    it "returns valid response" do
      content_language = create(:content_language)
      title = create(:title)
      volume = create(:volume, title: title)
      group = create(:group)
      chapter = create(:chapter, title: title, group: group)
      first_user = create(:user)
      second_user = create(:user)
      ctet_ids = [first_user.id, second_user.id]
      _group_user = create(:group_user, group: group, user: first_user)
      _group_user = create(:group_user, group: group, user: second_user)
      _group_user = create(:group_user_with_manage_chapters_access_right, group: group, user: current_user)

      params = {
        content_language_id: content_language.id,
        volume_id: volume.id,
        number: 1,
        name: "Title",
        cleaner_ids: ctet_ids,
        translator_ids: ctet_ids,
        editor_ids: ctet_ids,
        typer_ids: ctet_ids
      }

      put "/api/titles/#{title.to_param}/chapters/#{chapter.to_param}.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles/chapters_controller/update/200")
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      title = create(:title)
      group = create(:group)
      chapter = create(:chapter, title: title, group: group)
      _group_user = create(:group_user_with_manage_chapters_access_right, group: group, user: current_user)

      delete "/api/titles/#{title.to_param}/chapters/#{chapter.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
