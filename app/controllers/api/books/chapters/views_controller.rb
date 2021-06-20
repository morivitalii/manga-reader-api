class Api::Books::Chapters::ViewsController < Api::ApplicationController
  before_action :set_book, only: [:create]
  before_action :set_chapter, only: [:create]
  before_action -> { authorize(Api::Books::Chapters::ViewsPolicy) }, only: [:create]

  def create
    service = Api::Books::Chapters::CreateView.new(chapter: @chapter, user: Current.user)

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

  def books_scope
    policy_scope(Api::BooksPolicy, Book)
  end

  def chapters_scope
    policy_scope(Api::Books::ChaptersPolicy, @book.chapters)
  end
end
