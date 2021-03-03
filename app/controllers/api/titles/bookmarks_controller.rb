class Api::Titles::BookmarksController < Api::ApplicationController
  before_action :set_title, only: [:create, :destroy]
  before_action :set_bookmark, only: [:destroy]
  before_action -> { authorize(Api::Titles::BookmarksPolicy) }, only: [:create]
  before_action -> { authorize(Api::Titles::BookmarksPolicy, @bookmark) }, only: [:destroy]

  def create
    Api::Titles::CreateBookmarkWorker.perform_async(@title.id, current_user.id)

    head 204
  end

  def destroy
    Api::Titles::DeleteBookmarkWorker.perform_async(@bookmark.id)

    head 204
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
    policy_scope(Api::Titles::Chapters::BookmarksPolicy, @title.bookmarks)
  end
end
