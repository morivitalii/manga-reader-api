class Api::Users::Artists::FavoritesController < Api::ApplicationController
  before_action -> { authorize(Api::Users::Artists::FavoritesPolicy) }, only: [:index]
  before_action :set_user, only: [:index]

  def index
    service = Api::Users::Artists::FilterFavorites.new(filter_params)

    if service.call
      favorites = Api::ArtistFavoriteDecorator.decorate(service.favorites)
      favorites = Api::ArtistFavoriteSerializer.serialize(favorites)

      render json: favorites, status: 200
    else
      head 422
    end
  end

  private

  def set_user
    @user = Current.user
  end

  def filter_params
    permitted_attributes(Api::Users::Artists::FavoritesPolicy, :index).merge(scope: favorites_scope)
  end

  def favorites_scope
    scope = @user.favorites.where(resource_type: "Artist")

    policy_scope(Api::Users::Artists::FavoritesPolicy, scope)
  end
end
