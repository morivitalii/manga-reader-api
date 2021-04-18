class Api::Titles::BookmarksController < Api::ApplicationController
  before_action :set_title, only: [:create, :destroy]
  before_action :set_bookmark, only: [:destroy]
  before_action -> { authorize(Api::Titles::BookmarksPolicy) }, only: [:create]
  before_action -> { authorize(Api::Titles::BookmarksPolicy, bookmark: @bookmark) }, only: [:destroy]

  def create
    service = Api::Titles::CreateBookmark.new(title: @title, user: Current.user)

    if service.call
      bookmark = Api::TitleBookmarkDecorator.decorate(service.bookmark)
      bookmark = Api::TitleBookmarkSerializer.serialize(bookmark)

      render json: bookmark, status: 200
    else
      head 422
    end
  end

  def destroy
    service = Api::Titles::DeleteBookmark.new(bookmark: @bookmark)

    if service.call
      head 204
    else
      head 422
    end
  end

  private

  def set_title
    @title = titles_scope.find(params[:title_id])
  end

  def set_bookmark
    @bookmark = bookmarks_scope.find(params[:id])
  end

  def titles_scope
    policy_scope(Api::TitlesPolicy, Title)
  end

  def bookmarks_scope
    policy_scope(Api::Titles::BookmarksPolicy, @title.bookmarks)
  end
end
