require "rails_helper"

RSpec.describe DemographicsController do
  describe ".index" do
    it "returns valid response" do
      first_demographic = create(:demographic, tag: create(:tag, title: "A"))
      second_demographic = create(:demographic, tag: create(:tag, title: "B"))
      third_demographic = create(:demographic, tag: create(:tag, title: "C"))

      get "/demographics.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/demographics_controller/index/200")

      # Ensure that demographics sorted by tag title ASC
      expect(response).to have_objects_collection(first_demographic, second_demographic, third_demographic)
    end
  end

  describe ".show" do
    it "returns valid response" do
      demographic = create(:demographic)

      get "/demographics/#{demographic.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/demographics_controller/show/200")
    end
  end
end
