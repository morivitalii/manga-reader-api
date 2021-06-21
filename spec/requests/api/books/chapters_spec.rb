require "rails_helper"

RSpec.describe Api::Books::ChaptersController do
  describe ".index" do
    it "returns valid response" do
      book = create(:book)
      first_chapter = create(:chapter, book: book, number: 1)
      third_chapter = create(:chapter, book: book, number: 3)
      second_chapter = create(:chapter, book: book, number: 2)
      other_book = create(:book)
      _other_book_chapter = create(:chapter, book: other_book)

      get "/api/books/#{book.to_param}/chapters.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/books/chapters_controller/index/200")
      expect(response).to have_objects_collection(first_chapter, second_chapter, third_chapter)
    end
  end

  describe ".show" do
    it "returns valid response" do
      book = create(:book)
      chapter = create(:chapter, book: book)

      get "/api/books/#{book.to_param}/chapters/#{chapter.to_param}.json"

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/books/chapters_controller/show/200")
    end
  end

  describe ".create", context: :as_signed_in_user do
    it "returns valid response" do
      content_language = create(:content_language)
      book = create(:book)
      group = create(:group)
      first_user = create(:user)
      first_artist = create(:artist, user: first_user)
      second_user = create(:user)
      second_artist = create(:artist, user: second_user)
      ctet_ids = [first_artist.id, second_artist.id]
      _group_user = create(:group_user, group: group, user: first_user)
      _group_user = create(:group_user, group: group, user: second_user)

      grant_group_access_right(group, current_user, :manage_chapters)

      params = {
        content_language_id: content_language.id,
        volume: 1,
        group_id: group.id,
        number: 1,
				title: "Title",
        cleaner_ids: ctet_ids,
        translator_ids: ctet_ids,
        editor_ids: ctet_ids,
        typer_ids: ctet_ids
      }

      post "/api/books/#{book.to_param}/chapters.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/books/chapters_controller/create/200")
    end
  end

  describe ".update", context: :as_signed_in_user do
    it "returns valid response" do
      content_language = create(:content_language)
      book = create(:book)
      group = create(:group)
      chapter = create(:chapter, book: book, group: group)
      first_user = create(:user)
      first_artist = create(:artist, user: first_user)
      second_user = create(:user)
      second_artist = create(:artist, user: second_user)
      ctet_ids = [first_artist.id, second_artist.id]
      _group_user = create(:group_user, group: group, user: first_user)
      _group_user = create(:group_user, group: group, user: second_user)

      grant_group_access_right(group, current_user, :manage_chapters)

      params = {
        content_language_id: content_language.id,
        volume: 1,
        number: 1,
				title: "Title",
        cleaner_ids: ctet_ids,
        translator_ids: ctet_ids,
        editor_ids: ctet_ids,
        typer_ids: ctet_ids
      }

      put "/api/books/#{book.to_param}/chapters/#{chapter.to_param}.json", params: params

      expect(response).to have_http_status(200)
      expect(response).to match_json_schema("controllers/api/books/chapters_controller/update/200")
    end
  end

  describe ".destroy", context: :as_signed_in_user do
    it "returns valid response" do
      book = create(:book)
      group = create(:group)
      chapter = create(:chapter, book: book, group: group)

      grant_group_access_right(group, current_user, :manage_chapters)

      delete "/api/books/#{book.to_param}/chapters/#{chapter.to_param}.json"

      expect(response).to have_http_status(204)
    end
  end
end
