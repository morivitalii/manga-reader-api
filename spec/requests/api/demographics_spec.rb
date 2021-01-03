require "rails_helper"

RSpec.describe Api::DemographicsController do
  describe ".index" do
    it "returns valid response" do
      first_demographic = create(:demographic, tag: create(:tag, title: "A"))
      second_demographic = create(:demographic, tag: create(:tag, title: "B"))
      third_demographic = create(:demographic, tag: create(:tag, title: "C"))

      get "/api/demographics.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/demographics_controller/index/200")
      expect(response).to have_objects_collection(first_demographic, second_demographic, third_demographic)
    end
  end

  describe ".show" do
    it "returns valid response" do
      demographic = create(:demographic)

      get "/api/demographics/#{demographic.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/demographics_controller/show/200")
    end
  end
end
