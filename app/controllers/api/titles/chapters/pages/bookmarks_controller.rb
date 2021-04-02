class Api::Titles::Chapters::Pages::BookmarksController < Api::ApplicationController
  before_action :set_title, only: [:create, :destroy]
  before_action :set_chapter, only: [:create, :destroy]
  before_action :set_page, only: [:create, :destroy]
  before_action :set_bookmark, only: [:destroy]
  before_action -> { authorize(Api::Titles::Chapters::Pages::BookmarksPolicy) }, only: [:create]
  before_action -> { authorize(Api::Titles::Chapters::Pages::BookmarksPolicy, bookmark: @bookmark) }, only: [:destroy]

  def create
    service =  Api::Titles::Chapters::Pages::CreateBookmark.new(page: @page, user: Current.user)

    if service.call
      bookmark = Api::BookmarkDecorator.decorate(service.bookmark)
      bookmark = Api::BookmarkSerializer.serialize(bookmark)

      render json: bookmark, status: 200
    else
      head 422
    end
  end

  def destroy
    service = Api::Titles::Chapters::Pages::DeleteBookmark.new(bookmark: @bookmark)

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

  def set_chapter
    @chapter = chapters_scope.find(params[:chapter_id])
  end

  def set_page
    @page = pages_scope.find(params[:page_id])
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

  def pages_scope
    policy_scope(Api::Titles::Chapters::PagesPolicy, @chapter.pages)
  end

  def bookmarks_scope
    policy_scope(Api::Titles::Chapters::Pages::BookmarksPolicy, @page.bookmarks)
  end
end
