require "rails_helper"

RSpec.describe Api::BooksController do
  describe ".index" do
    it "returns valid response" do
      first_book = create(:book, title: "A")
      second_book = create(:book, title: "B")
      third_book = create(:book, title: "C")
      _fourth_book = create(:book, title: "D")

      params = {}
      pagination_params = {
        page: 1,
        limit: 3
      }

      params.merge!(pagination_params)

      get "/api/books.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to have_countless_pagination_headers(pagination_params)
      expect(response).to match_json_schema("controllers/api/books_controller/index/200")
      expect(response).to have_objects_collection(first_book, second_book, third_book)
    end
  end

  describe ".show" do
    it "returns valid response" do
      book = create(:book)

      get "/api/books/#{book.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/books_controller/show/200")
    end
  end

  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      original_content_language = create(:content_language)
      writers = create_list(:artist, 2)
      painters = create_list(:artist, 2)
      genres = create_list(:tag, 2)
      formats = create_list(:tag, 2)
      demographics = create_list(:tag, 2)
      marks = create_list(:tag, 2)
      themes = create_list(:tag, 2)

      grant_access_right(current_user, :manage_content)

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

      post "/api/books.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/books_controller/create/200")
    end
	end

  describe ".update", context: :as_signed_in_user do
    it "returns valid response" do
			book = create(:book)
      original_content_language = create(:content_language)
      writers = create_list(:artist, 2)
      painters = create_list(:artist, 2)
      genres = create_list(:tag, 2)
      formats = create_list(:tag, 2)
      demographics = create_list(:tag, 2)
      marks = create_list(:tag, 2)
      themes = create_list(:tag, 2)

      grant_access_right(current_user, :manage_content)

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

			put "/api/books/#{book.to_param}.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/books_controller/update/200")
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      book = create(:book)

      grant_access_right(current_user, :manage_content)

      delete "/api/books/#{book.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
