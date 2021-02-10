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
end
