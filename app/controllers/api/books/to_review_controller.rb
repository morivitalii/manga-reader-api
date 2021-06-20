class Api::Books::ToReviewController < Api::ApplicationController
  before_action :set_book, only: [:update]

  before_action -> { authorize(Api::Books::ToReviewPolicy, book: @book) }, only: [:update]

  def update
    service = Api::Books::ToReview.new(book: @book)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        @book, [
          Book.translations_associations,
          original_content_language: [
            :locale,
            ContentLanguage.translations_associations
          ],
          cover_attachment: :blob,
          resource_artists: { artist: Artist.translations_associations },
          resource_tags: { tag: Tag.translations_associations }
        ]
      )

      book = Api::BookDecorator.decorate(@book)
      book = Api::BookSerializer.serialize(book)

      render json: book, status: 200
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
end
