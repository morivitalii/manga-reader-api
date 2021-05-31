require "rails_helper"

RSpec.describe Api::SignUpController, context: :as_signed_out_user do
  describe ".create" do
    it "returns valid response" do
      params = {
        username: "riko",
        email: "riko@example.com",
        password: "password"
      }

      post "/api/sign_up.json", params: params

      expect(session["warden.user.default.key"]).to_not be_nil
      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/sign_up_controller/create/200")
    end
  end
end
