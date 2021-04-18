class Api::Titles::Chapters::Pages::ViewsController < Api::ApplicationController
  before_action :set_title, only: [:create]
  before_action :set_chapter, only: [:create]
  before_action :set_page, only: [:create]
  before_action -> { authorize(Api::Titles::Chapters::Pages::ViewsPolicy) }, only: [:create]

  def create
    service = Api::Titles::Chapters::Pages::CreateView.new(page: @page, user: Current.user)

    if service.call
      view = Api::PageViewDecorator.decorate(service.view)
      view = Api::PageViewSerializer.serialize(view)

      render json: view, status: 200
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
