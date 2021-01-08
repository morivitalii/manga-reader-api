require "rails_helper"

RSpec.describe Api::SignInController, context: :as_signed_out_user do
  describe ".create" do
    context "with valid params" do
      it "returns valid response" do
        user = create(:user, username: "riko", password: "password")
        params = {
          username: "riko",
          password: "password"
        }

        post "/api/sign_in.json", params: params

        expect(session["warden.user.default.key"]).to eq(user.id)
        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/sign_in_controller/create/200")
      end
    end

    context "with invalid params" do
      it "returns valid response" do
        params = {
          username: "username",
          password: "password"
        }

        post "/api/sign_in.json", params: params

        expect(session["warden.user.default.key"]).to be_nil
        expect(response).to have_http_status(422)
        expect(response).to match_json_schema("controllers/api/sign_in_controller/create/422")
      end
    end
  end
end
