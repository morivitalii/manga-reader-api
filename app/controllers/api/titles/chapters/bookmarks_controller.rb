class Api::Titles::Chapters::BookmarksController < Api::ApplicationController
  before_action :set_title, only: [:create, :destroy]
  before_action :set_chapter, only: [:create, :destroy]
  before_action :set_bookmark, only: [:destroy]
  before_action -> { authorize(Api::Titles::Chapters::BookmarksPolicy) }, only: [:create]
  before_action -> { authorize(Api::Titles::Chapters::BookmarksPolicy, @bookmark) }, only: [:destroy]

  def create
    Api::Titles::Chapters::CreateBookmarkWorker.perform_async(@chapter.id, current_user.id)

    head 204
  end

  def destroy
    Api::Titles::Chapters::DeleteBookmarkWorker.perform_async(@bookmark.id)

    head 204
  end

  private

  def set_title
    @title = titles_scope.find(params[:title_id])
  end

  def set_chapter
    @chapter = chapters_scope.find(params[:chapter_id])
  end

  def set_bookmark
    @bookmark = bookmarks_scope.find(params[:id])
  end

  def titles_scope
    policy_scope(Api::TitlesPolicy, Title)
  end

  def chapters_scope
    policy_scope(Api::Titles::ChaptersPolicy, @title.chapters)
  end

  def bookmarks_scope
    policy_scope(Api::Titles::Chapters::BookmarksPolicy, @chapter.bookmarks)
  end
end
