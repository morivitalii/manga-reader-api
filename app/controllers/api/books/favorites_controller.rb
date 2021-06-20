class Api::Books::FavoritesController < Api::ApplicationController
  before_action :set_book, only: [:create, :destroy]
  before_action :set_favorite, only: [:destroy]
  before_action -> { authorize(Api::Books::FavoritesPolicy) }, only: [:create]
  before_action -> { authorize(Api::Books::FavoritesPolicy, favorite: @favorite) }, only: [:destroy]

  def create
    service = Api::Books::CreateFavorite.new(book: @book, user: Current.user)

    if service.call
      favorite = Api::FavoriteDecorator.decorate(service.favorite)
      favorite = Api::FavoriteSerializer.serialize(favorite)

      render json: favorite, status: 200
    else
      head 422
    end
  end

  def destroy
    service = Api::Books::DeleteFavorite.new(favorite: @favorite)

    if service.call
      head 204
    else
      head 422
    end
  end

  private

  def set_book
    @book = books_scope.find(params[:book_id])
  end

  def set_favorite
    @favorite = favorites_scope.find(params[:id])
  end

  def books_scope
    policy_scope(Api::BooksPolicy, Book)
  end

  def favorites_scope
    policy_scope(Api::Books::FavoritesPolicy, @book.favorites)
  end
end
