require "rails_helper"

RSpec.describe Api::ContentLanguagesController do
  describe ".index" do
    it "returns valid response" do
      # Entries creation skipped because english and russian interface languages created through rspec contexts
      # That is enough for this spec

      get "/api/content_languages.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/content_languages_controller/index/200")
    end
  end

  describe ".show" do
    it "returns valid response" do
      # Entries creation skipped because english interface language created through rspec contexts
      # That is enough for this spec

      get "/api/content_languages/#{Current.content_language.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/content_languages_controller/show/200")
    end
  end

  describe ".create", context: :as_signed_in_user do
    context "with valid params" do
      it "returns valid response" do
        locale = create(:locale)

        grant_access_right(current_user, :manage_system_settings)

        params = {
          locale_id: locale.id,
          title: "Title"
        }

        post "/api/content_languages.json", params: params

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/content_languages_controller/create/200")
      end
    end
  end

  describe ".update", context: :as_signed_in_user do
    context "with valid params" do
      it "returns valid response" do
        content_language = create(:content_language)

        grant_access_right(current_user, :manage_system_settings)

        params = {
          title: "Title"
        }

        put "/api/content_languages/#{content_language.to_param}.json", params: params

        expect(response).to have_http_status(200)
        expect(response).to match_json_schema("controllers/api/content_languages_controller/update/200")
      end
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      content_language = create(:content_language)

      grant_access_right(current_user, :manage_system_settings)

      delete "/api/content_languages/#{content_language.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
