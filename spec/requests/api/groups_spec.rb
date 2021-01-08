require "rails_helper"

RSpec.describe Api::GroupsController do
  describe ".index" do
    it "returns valid response" do
      first_group = create(:group, title: "A")
      second_group = create(:group, title: "B")
      third_group = create(:group, title: "C")
      _fourth_group = create(:group, title: "D")

      params = {}
      pagination_params = {
        page: 1,
        limit: 3
      }

      params.merge!(pagination_params)

      get "/api/groups.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to have_countless_pagination_headers(pagination_params)
      expect(response).to match_json_schema("controllers/api/groups_controller/index/200")
      expect(response).to have_objects_collection(first_group, second_group, third_group)
    end
  end
end
