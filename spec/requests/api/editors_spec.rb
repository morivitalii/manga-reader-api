require "rails_helper"

RSpec.describe Api::EditorsController do
  describe ".index" do
    it "returns valid response" do
      first_editor = create(:editor)
      second_editor = create(:editor)
      third_editor = create(:editor)
      _fourth_editor = create(:editor)

      params = {}
      pagination_params = {
        page: 1,
        limit: 3
      }

      params.merge!(pagination_params)

      get "/api/editors.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to have_countless_pagination_headers(pagination_params)
      expect(response).to match_json_schema("controllers/api/editors_controller/index/200")
      expect(response).to have_objects_collection(first_editor, second_editor, third_editor)
    end
  end

  describe ".show" do
    it "returns valid response" do
      editor = create(:editor)

      get "/api/editors/#{editor.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/editors_controller/show/200")
    end
  end
end
