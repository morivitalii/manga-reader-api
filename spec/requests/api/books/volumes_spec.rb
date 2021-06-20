require "rails_helper"

RSpec.describe Api::Books::VolumesController do
  describe ".index" do
    it "returns valid response" do
      book = create(:book)
      first_volume = create(:volume, book: book, number: 1)
      third_volume = create(:volume, book: book, number: 3)
      second_volume = create(:volume, book: book, number: 2)
      other_book = create(:book)
      _other_book_volume = create(:volume, book: other_book)

      get "/api/books/#{book.to_param}/volumes.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/books/volumes_controller/index/200")
      expect(response).to have_objects_collection(first_volume, second_volume, third_volume)
    end
  end

  describe ".show" do
    it "returns valid response" do
      book = create(:book)
      volume = create(:volume, book: book)

      get "/api/books/#{book.to_param}/volumes/#{volume.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/books/volumes_controller/show/200")
    end
	end

  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      book = create(:book)

      grant_access_right(current_user, :manage_books)

      params = {
        number: 1
      }

      post "/api/books/#{book.to_param}/volumes.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/books/volumes_controller/create/200")
    end
  end

  describe ".update", context: :as_signed_in_user do
    it "returns valid response" do
      book = create(:book)
      volume = create(:volume, book: book)

      grant_access_right(current_user, :manage_books)

      params = {
        number: 1
      }

      put "/api/books/#{book.to_param}/volumes/#{volume.to_param}.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/books/volumes_controller/update/200")
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      book = create(:book)
      volume = create(:volume, book: book)

      grant_access_right(current_user, :manage_books)

      delete "/api/books/#{book.to_param}/volumes/#{volume.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
