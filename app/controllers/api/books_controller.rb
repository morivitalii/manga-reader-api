class Api::BooksController < Api::ApplicationController
  include Pagination

  before_action :set_book, only: [:show, :update, :destroy]

  before_action -> { authorize(Api::BooksPolicy) }, only: [:index, :create]
  before_action -> { authorize(Api::BooksPolicy, book: @book) }, only: [:show, :update, :destroy]

  skip_after_action :verify_policy_scoped, only: [:create]

  def index
    books = books_scope.joins(:translations).order("book_translations.title ASC").all
    books = paginate_countless(books)

    ActiveRecord::Associations::Preloader.new.preload(
      books, [
        Book.translations_associations,
        cover_attachment: :blob,
        resource_artists: { artist: Artist.translations_associations },
        resource_tags: { tag: Tag.translations_associations }
      ]
    )

    books = Api::BookDecorator.decorate(books)
    books = Api::BookSerializer.serialize(books)

    render json: books, status: 200
  end

  def show
    ActiveRecord::Associations::Preloader.new.preload(
      @book, [
        Book.translations_associations,
        cover_attachment: :blob,
        resource_artists: { artist: Artist.translations_associations },
        resource_tags: { tag: Tag.translations_associations }
      ]
    )

    book = Api::BookDecorator.decorate(@book)
    book = Api::BookSerializer.serialize(book)

    render json: book, status: 200
  end

  def create
    service = Api::CreateBook.new(create_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.book, [
          Book.translations_associations,
          cover_attachment: :blob,
          resource_artists: { artist: Artist.translations_associations },
          resource_tags: { tag: Tag.translations_associations }
        ]
      )

      book = Api::BookDecorator.decorate(service.book)
      book = Api::BookSerializer.serialize(book)

      render json: book, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def update
    service = Api::UpdateBook.new(update_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.book, [
        Book.translations_associations,
          cover_attachment: :blob,
          resource_artists: { artist: Artist.translations_associations },
          resource_tags: { tag: Tag.translations_associations }
        ]
      )

      book = Api::BookDecorator.decorate(service.book)
      book = Api::BookSerializer.serialize(book)

      render json: book, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def destroy
    service = Api::DeleteBook.new(book: @book)

    if service.call
      head 204
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_book
    @book = books_scope.find(params[:id])
  end

  def create_params
    permitted_attributes(Api::BooksPolicy, :create)
  end

  def update_params
    permitted_attributes(Api::BooksPolicy, :update).merge(book: @book)
  end

  def books_scope
    policy_scope(Api::BooksPolicy, Book)
  end
end
