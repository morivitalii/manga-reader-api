require "rails_helper"

RSpec.describe Api::Titles::VolumesController do
  describe ".index" do
    it "returns valid response" do
      title = create(:title)
      first_volume = create(:volume, title: title, number: 1)
      third_volume = create(:volume, title: title, number: 3)
      second_volume = create(:volume, title: title, number: 2)
      other_title = create(:title)
      _other_title_volume = create(:volume, title: other_title)

      get "/api/titles/#{title.to_param}/volumes.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles/volumes_controller/index/200")
      expect(response).to have_objects_collection(first_volume, second_volume, third_volume)
    end
  end

  describe ".show" do
    it "returns valid response" do
      title = create(:title)
      volume = create(:volume, title: title)

      get "/api/titles/#{title.to_param}/volumes/#{volume.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles/volumes_controller/show/200")
    end
	end

  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      title = create(:title)

      grant_access_right(current_user, :manage_titles)

      params = {
        number: 1
      }

      post "/api/titles/#{title.to_param}/volumes.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles/volumes_controller/create/200")
    end
  end

  describe ".update", context: :as_signed_in_user do
    it "returns valid response" do
      title = create(:title)
      volume = create(:volume, title: title)

      grant_access_right(current_user, :manage_titles)

      params = {
        number: 1
      }

      put "/api/titles/#{title.to_param}/volumes/#{volume.to_param}.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles/volumes_controller/update/200")
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      title = create(:title)
      volume = create(:volume, title: title)

      grant_access_right(current_user, :manage_titles)

      delete "/api/titles/#{title.to_param}/volumes/#{volume.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
