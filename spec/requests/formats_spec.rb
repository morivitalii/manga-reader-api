require "rails_helper"

RSpec.describe FormatsController do
  describe ".index" do
    it "returns valid response" do
      first_format = create(:format, tag: create(:tag, title: "A"))
      second_format = create(:format, tag: create(:tag, title: "B"))
      third_format = create(:format, tag: create(:tag, title: "C"))

      get "/formats.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/formats_controller/index/200")

      # Ensure that formats sorted by tag title ASC
      expect(response).to have_objects_collection(first_format, second_format, third_format)
    end
  end

  describe ".show" do
    it "returns valid response" do
      format = create(:format)

      get "/formats/#{format.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/formats_controller/show/200")
    end
  end
end
