class Api::Titles::Chapters::PagesController < Api::ApplicationController
  before_action :set_title, only: [:index, :show, :create]
  before_action :set_chapter, only: [:index, :show, :create]
  before_action :set_page, only: [:show]
  before_action :set_page_associations, only: [:show]

  before_action -> { authorize(Api::Titles::Chapters::PagesPolicy) }, only: [:index, :create]
  before_action -> { authorize(Api::Titles::Chapters::PagesPolicy, page: @page) }, only: [:show]

  def index
    pages = pages_scope.order("pages.number ASC").all

    ActiveRecord::Associations::Preloader.new.preload(
      pages, [
        file_attachment: :blob
      ]
    )

    pages = Api::PageDecorator.decorate(pages)
    pages = Api::PageSerializer.serialize(pages)

    render json: pages, status: 200
  end

  def show
    page = Api::PageDecorator.decorate(@page)
    page = Api::PageSerializer.serialize(page)

    render json: page, status: 200
  end

  def create
    service = Api::Titles::Chapters::CreatePage.new(create_params)

    if service.call
      page = Api::PageDecorator.decorate(service.page)
      page = Api::PageSerializer.serialize(page)

      render json: page, status: 200
    else
      render json: service.errors, status: 422
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
    @page = pages_scope.find(params[:id])
  end

  def create_params
    permitted_attributes(Api::Titles::Chapters::PagesPolicy, :create).merge(chapter: @chapter, user: Current.user)
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

  def set_page_associations
    ActiveRecord::Associations::Preloader.new.preload(
    @page, [
        file_attachment: :blob
      ]
    )
  end
end
