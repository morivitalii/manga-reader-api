require "rails_helper"

RSpec.describe Api::TagsController do
  describe ".index" do
    it "returns valid response" do
      first_tag = create(:tag, title: "A")
      second_tag = create(:tag, title: "B")
      third_tag = create(:tag, title: "C")

      get "/api/tags.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/tags_controller/index/200")

      # Ensure that tags sorted by title ASC
      expect(response).to have_objects_collection(first_tag, second_tag, third_tag)
    end
  end

  describe ".show" do
    it "returns valid response" do
      tag = create(:tag)

      get "/api/tags/#{tag.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/tags_controller/show/200")
    end
  end
end
