class Api::Books::Chapters::BookmarksController < Api::ApplicationController
  before_action :set_book, only: [:create, :destroy]
  before_action :set_chapter, only: [:create, :destroy]
  before_action :set_bookmark, only: [:destroy]
  before_action -> { authorize(Api::Books::Chapters::BookmarksPolicy) }, only: [:create]
  before_action -> { authorize(Api::Books::Chapters::BookmarksPolicy, bookmark: @bookmark) }, only: [:destroy]

  def create
    service = Api::Books::Chapters::CreateBookmark.new(chapter: @chapter, user: Current.user)

    if service.call
      bookmark = Api::BookmarkDecorator.decorate(service.bookmark)
      bookmark = Api::BookmarkSerializer.serialize(bookmark)

      render json: bookmark, status: 200
    else
      head 422
    end
  end

  def destroy
    service = Api::Books::Chapters::DeleteBookmark.new(bookmark: @bookmark)

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

  def set_bookmark
    @bookmark = bookmarks_scope.find(params[:id])
  end

  def books_scope
    policy_scope(Api::BooksPolicy, Book)
  end

  def chapters_scope
    policy_scope(Api::Books::ChaptersPolicy, @book.chapters)
  end

  def bookmarks_scope
    policy_scope(Api::Books::Chapters::BookmarksPolicy, @chapter.bookmarks)
  end
end
