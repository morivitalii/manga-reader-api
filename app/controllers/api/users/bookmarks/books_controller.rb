class Api::Users::Bookmarks::BooksController < Api::ApplicationController
  before_action -> { authorize(Api::Users::Bookmarks::BooksPolicy) }, only: [:index]
  before_action :set_user, only: [:index]

  def index
    books = books_scope.joins(:bookmarks).where(bookmarks: {user: @user}).order("bookmarks.updated_at DESC")
    books = paginate_countless(books)

    ActiveRecord::Associations::Preloader.new.preload(
      books, [
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

    books = Api::BookDecorator.decorate(books)
    books = Api::BookSerializer.serialize(books)

    render json: books, status: 200
  end

  private

  def set_user
    @user = Current.user
  end

  def books_scope
    policy_scope(Api::Users::Bookmarks::BooksPolicy, Book)
  end
end
