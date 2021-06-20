class Api::Books::BookmarksController < Api::ApplicationController
  before_action :set_book, only: [:create, :destroy]
  before_action :set_bookmark, only: [:destroy]
  before_action -> { authorize(Api::Books::BookmarksPolicy) }, only: [:create]
  before_action -> { authorize(Api::Books::BookmarksPolicy, bookmark: @bookmark) }, only: [:destroy]

  def create
    service = Api::Books::CreateBookmark.new(book: @book, user: Current.user)

    if service.call
      bookmark = Api::BookmarkDecorator.decorate(service.bookmark)
      bookmark = Api::BookmarkSerializer.serialize(bookmark)

      render json: bookmark, status: 200
    else
      head 422
    end
  end

  def destroy
    service = Api::Books::DeleteBookmark.new(bookmark: @bookmark)

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

  def set_bookmark
    @bookmark = bookmarks_scope.find(params[:id])
  end

  def books_scope
    policy_scope(Api::BooksPolicy, Book)
  end

  def bookmarks_scope
    policy_scope(Api::Books::BookmarksPolicy, @book.bookmarks)
  end
end
