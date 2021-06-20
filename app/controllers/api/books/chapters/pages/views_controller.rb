class Api::Books::Chapters::Pages::ViewsController < Api::ApplicationController
  before_action :set_book, only: [:create]
  before_action :set_chapter, only: [:create]
  before_action :set_page, only: [:create]
  before_action -> { authorize(Api::Books::Chapters::Pages::ViewsPolicy) }, only: [:create]

  def create
    service = Api::Books::Chapters::Pages::CreateView.new(page: @page, user: Current.user)

    if service.call
      view = Api::ViewDecorator.decorate(service.view)
      view = Api::ViewSerializer.serialize(view)

      render json: view, status: 200
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

  def books_scope
    policy_scope(Api::BooksPolicy, Book)
  end

  def chapters_scope
    policy_scope(Api::Books::ChaptersPolicy, @book.chapters)
  end

  def pages_scope
    policy_scope(Api::Books::Chapters::PagesPolicy, @chapter.pages)
  end
end
