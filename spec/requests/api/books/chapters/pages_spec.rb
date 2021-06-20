require "rails_helper"

RSpec.describe Api::Books::Chapters::PagesController do
  describe ".index" do
    it "returns valid response" do
      book = create(:book)
      chapter = create(:chapter, book: book)
      first_page = create(:page, chapter: chapter, number: 1)
      third_page = create(:page, chapter: chapter, number: 3)
      second_page = create(:page, chapter: chapter, number: 2)
      _other_page = create(:page)

      get "/api/books/#{book.to_param}/chapters/#{chapter.to_param}/pages.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/books/chapters/pages_controller/index/200")
      expect(response).to have_objects_collection(first_page, second_page, third_page)
    end
  end

  describe ".show" do
    it "returns valid response" do
      book = create(:book)
      chapter = create(:chapter, book: book)
      page = create(:page, chapter: chapter)

      get "/api/books/#{book.to_param}/chapters/#{chapter.to_param}/pages/#{page.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/books/chapters/pages_controller/show/200")
    end
  end

  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      book = create(:book)
      group = create(:group)
      chapter = create(:chapter, book: book, group: group)

      grant_group_access_right(group, current_user, :manage_chapters)

      params = {
        number: 1,
        file: Rack::Test::UploadedFile.new("spec/fixtures/page.jpg")
      }

      post "/api/books/#{book.to_param}/chapters/#{chapter.to_param}/pages.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/books/chapters/pages_controller/create/200")
    end
  end
end
