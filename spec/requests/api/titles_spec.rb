require "rails_helper"

RSpec.describe Api::TitlesController do
  describe ".index" do
    it "returns valid response" do
      first_title = create(:title, title: "A")
      second_title = create(:title, title: "B")
      third_title = create(:title, title: "C")
      _fourth_title = create(:title, title: "D")

      params = {}
      pagination_params = {
        page: 1,
        limit: 3
      }

      params.merge!(pagination_params)

      get "/api/titles.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to have_countless_pagination_headers(pagination_params)
      expect(response).to match_json_schema("controllers/api/titles_controller/index/200")
      expect(response).to have_objects_collection(first_title, second_title, third_title)
    end
  end

  describe ".show" do
    it "returns valid response" do
      title = create(:title)

      get "/api/titles/#{title.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles_controller/show/200")
    end
  end

  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      original_content_language = create(:content_language)
      writers = create_list(:writer, 2)
      painters = create_list(:painter, 2)
      genres = create_list(:genre, 2)
      formats = create_list(:format, 2)
      demographics = create_list(:demographic, 2)
      marks = create_list(:mark, 2)
      themes = create_list(:theme, 2)

      grant_access_right(current_user, :manage_titles)

      params = {
        title: "Title",
        description: "Description",
        publication_status: "ongoing",
        original_content_language_id: original_content_language.id,
        writer_ids: writers.map(&:id),
        painter_ids: painters.map(&:id),
        genre_ids: genres.map(&:id),
        format_ids: formats.map(&:id),
        demographic_ids: demographics.map(&:id),
        mark_ids: marks.map(&:id),
        theme_ids: themes.map(&:id)
      }

      post "/api/titles.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles_controller/create/200")
    end
	end

  describe ".update", context: :as_signed_in_user do
    it "returns valid response" do
			title = create(:title)
      original_content_language = create(:content_language)
      writers = create_list(:writer, 2)
      painters = create_list(:painter, 2)
      genres = create_list(:genre, 2)
      formats = create_list(:format, 2)
      demographics = create_list(:demographic, 2)
      marks = create_list(:mark, 2)
      themes = create_list(:theme, 2)

      grant_access_right(current_user, :manage_titles)

      params = {
        title: "Title",
        description: "Description",
        publication_status: "ongoing",
        original_content_language_id: original_content_language.id,
        writer_ids: writers.map(&:id),
        painter_ids: painters.map(&:id),
        genre_ids: genres.map(&:id),
        format_ids: formats.map(&:id),
        demographic_ids: demographics.map(&:id),
        mark_ids: marks.map(&:id),
        theme_ids: themes.map(&:id)
      }

			put "/api/titles/#{title.to_param}.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/titles_controller/update/200")
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      title = create(:title)

      grant_access_right(current_user, :manage_titles)

      delete "/api/titles/#{title.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
