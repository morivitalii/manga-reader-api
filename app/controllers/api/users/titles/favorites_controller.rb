class Api::Users::Titles::FavoritesController < Api::ApplicationController
  before_action -> { authorize(Api::Users::Titles::FavoritesPolicy) }, only: [:index]
  before_action :set_user, only: [:index]

  def index
    service = Api::Users::Titles::FilterFavorites.new(filter_params)

    if service.call
      favorites = Api::FavoriteDecorator.decorate(service.favorites)
      favorites = Api::FavoriteSerializer.serialize(favorites)

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
    permitted_attributes(Api::Users::Titles::FavoritesPolicy, :index).merge(scope: favorites_scope)
  end

  def favorites_scope
    scope = @user.favorites.where(resource_type: "Title")

    policy_scope(Api::Users::Titles::FavoritesPolicy, scope)
  end
end
