class Api::Artists::FavoritesController < Api::ApplicationController
  before_action :set_artist, only: [:create, :destroy]
  before_action :set_favorite, only: [:destroy]
  before_action -> { authorize(Api::Artists::FavoritesPolicy) }, only: [:create]
  before_action -> { authorize(Api::Artists::FavoritesPolicy, @favorite) }, only: [:destroy]

  def create
    service = Api::Artists::CreateFavorite.new(artist: @artist, user: Current.user)

    if service.call
      favorite = Api::FavoriteDecorator.decorate(service.favorite)
      favorite = Api::FavoriteSerializer.serialize(favorite)

      render json: favorite, status: 200
    else
      head 422
    end
  end

  def destroy
    service = Api::Artists::DeleteFavorite.new(favorite: @favorite)

    if service.call
      head 204
    else
      head 422
    end
  end

  private

  def set_artist
    @artist = artists_scope.find(params[:artist_id])
  end

  def set_favorite
    @favorite = favorites_scope.find(params[:id])
  end

  def artists_scope
    policy_scope(Api::ArtistsPolicy, Artist)
  end

  def favorites_scope
    policy_scope(Api::Artists::FavoritesPolicy, @artist.favorites)
  end
end
