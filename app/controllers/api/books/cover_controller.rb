class Api::Books::CoverController < Api::ApplicationController
  before_action :set_book, only: [:update, :destroy]

  before_action -> { authorize(Api::Books::CoverPolicy, book: @book) }, only: [:update, :destroy]

  def update
    service = Api::Books::UpdateCover.new(update_params)

    if service.call
      book = Api::BookDecorator.decorate(service.book)
      book = Api::BookSerializer.serialize(book)

      render json: book, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def destroy
    service = Api::Books::DeleteCover.new(book: @book)

    if service.call
      head 204
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_book
    @book = books_scope.find(params[:book_id])
  end

  def books_scope
    policy_scope(Api::BooksPolicy, Book)
  end

  def update_params
    permitted_attributes(Api::Books::CoverPolicy, :update).merge(book: @book)
  end
end
