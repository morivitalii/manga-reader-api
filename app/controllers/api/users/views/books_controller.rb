class Api::Users::Views::BooksController < Api::ApplicationController
  include Pagination

  before_action -> { authorize(Api::Users::Views::BooksPolicy) }, only: [:index]
  before_action :set_user, only: [:index]

  def index
    books = books_scope.joins(:views).where(views: {user: @user}).order("views.updated_at DESC")
    books = paginate_countless(books)

    ActiveRecord::Associations::Preloader.new.preload(
      books, [
        Book.translations_associations,
        original_content_language: [
          :locale,
          ContentLanguage.translations_associations
        ],
        resource_artists: { artist: Artist.translations_associations },
        cover_attachment: :blob,
        resource_tags: { tag: Tag.translations_associations }
      ]
    )

    books = Api::BookDecorator.decorate(books)
    books = Api::BookSerializer.serialize(books)

    render json: books, status: 200
  end

  private

  def set_user
    @user = Current.user
  end

  def books_scope
    policy_scope(Api::Users::Views::BooksPolicy, Book)
  end
end
