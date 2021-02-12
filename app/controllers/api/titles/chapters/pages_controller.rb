class Api::Titles::Chapters::PagesController < Api::ApplicationController
  before_action :set_title, only: [:index, :show]
  before_action :set_chapter, only: [:index, :show]
  before_action :set_page, only: [:show]

  before_action -> { authorize(Api::Titles::Chapters::PagesPolicy) }, only: [:index]
  before_action -> { authorize(Api::Titles::Chapters::PagesPolicy, @page) }, only: [:show]

  def index
    pages = pages_scope.order("pages.number ASC").all

    pages = Api::PageDecorator.decorate(pages)
    pages = Api::PageSerializer.serialize(pages)

    render json: pages, status: 200
  end

  def show
    page = Api::PageDecorator.decorate(@page)
    page = Api::PageSerializer.serialize(page)

    render json: page, status: 200
  end

  private

  def set_title
    @title = titles_scope.find(params[:title_id])
  end

  def set_chapter
    @chapter = chapters_scope.find(params[:chapter_id])
  end

  def set_page
    @page = pages_scope.find(params[:id])
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
end
