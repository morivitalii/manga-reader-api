class Api::Books::Chapters::Pages::BookmarksController < Api::ApplicationController
  before_action :set_book, only: [:create, :destroy]
  before_action :set_chapter, only: [:create, :destroy]
  before_action :set_page, only: [:create, :destroy]
  before_action :set_bookmark, only: [:destroy]
  before_action -> { authorize(Api::Books::Chapters::Pages::BookmarksPolicy) }, only: [:create]
  before_action -> { authorize(Api::Books::Chapters::Pages::BookmarksPolicy, bookmark: @bookmark) }, only: [:destroy]

  def create
    service =  Api::Books::Chapters::Pages::CreateBookmark.new(page: @page, user: Current.user)

    if service.call
      bookmark = Api::BookmarkDecorator.decorate(service.bookmark)
      bookmark = Api::BookmarkSerializer.serialize(bookmark)

      render json: bookmark, status: 200
    else
      head 422
    end
  end

  def destroy
    service = Api::Books::Chapters::Pages::DeleteBookmark.new(bookmark: @bookmark)

    if service.call
      head 204
    else
      head 422
    end
  end

  private

  def set_book
    @book = books_scope.find(params[:book_id])
  end

  def set_chapter
    @chapter = chapters_scope.find(params[:chapter_id])
  end

  def set_page
    @page = pages_scope.find(params[:page_id])
  end

  def set_bookmark
    @bookmark = bookmarks_scope.find(params[:id])
  end

  def books_scope
    policy_scope(Api::BooksPolicy, Book)
  end

  def chapters_scope
    policy_scope(Api::Books::ChaptersPolicy, @book.chapters)
  end

  def pages_scope
    policy_scope(Api::Books::Chapters::PagesPolicy, @chapter.pages)
  end

  def bookmarks_scope
    policy_scope(Api::Books::Chapters::Pages::BookmarksPolicy, @page.bookmarks)
  end
end
