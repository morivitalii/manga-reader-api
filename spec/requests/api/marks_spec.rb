require "rails_helper"

RSpec.describe Api::MarksController do
  describe ".index" do
    it "returns valid response" do
      first_mark = create(:mark, tag: create(:tag, title: "A"))
      second_mark = create(:mark, tag: create(:tag, title: "B"))
      third_mark = create(:mark, tag: create(:tag, title: "C"))

      get "/api/marks.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/marks_controller/index/200")

      # Ensure that marks sorted by tag title ASC
      expect(response).to have_objects_collection(first_mark, second_mark, third_mark)
    end
  end

  describe ".show" do
    it "returns valid response" do
      mark = create(:mark)

      get "/api/marks/#{mark.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/marks_controller/show/200")
    end
  end
end
