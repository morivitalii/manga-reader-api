require "rails_helper"

RSpec.describe Api::LocalesController do
  describe ".index", context: :as_signed_in_user do
    it "returns valid response" do
      first_locale = create(:locale)
      second_locale = create(:locale)
      third_locale = create(:locale)
			context_primary_locale = Locale.order(id: :asc).first
      context_secondary_locale = Locale.order(id: :asc).second

      grant_access_right(current_user, :manage_system_settings)

      get "/api/locales.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/locales_controller/index/200")
      expect(response).to have_objects_collection(
        context_primary_locale,
        context_secondary_locale,
        first_locale,
        second_locale,
        third_locale
      )
    end
  end

  describe ".show", context: :as_signed_in_user do
    it "returns valid response" do
      locale = create(:locale)

      grant_access_right(current_user, :manage_system_settings)

      get "/api/locales/#{locale.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/locales_controller/show/200")
    end
  end

  describe ".create", context: :as_signed_in_user do
    context "with valid params" do
      it "returns valid response" do
        grant_access_right(current_user, :manage_system_settings)

        params = {
          key: "uk"
        }

        post "/api/locales.json", params: params

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/locales_controller/create/200")
      end
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      locale = create(:locale)

      grant_access_right(current_user, :manage_system_settings)

      delete "/api/locales/#{locale.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
