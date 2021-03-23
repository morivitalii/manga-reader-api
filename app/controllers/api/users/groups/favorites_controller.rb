class Api::Users::Groups::FavoritesController < Api::ApplicationController
  before_action -> { authorize(Api::Users::Groups::FavoritesPolicy) }, only: [:index]
  before_action :set_user, only: [:index]

  def index
    service = Api::Users::Groups::FilterFavorites.new(filter_params)

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
    permitted_attributes(Api::Users::Groups::FavoritesPolicy, :index).merge(scope: favorites_scope)
  end

  def favorites_scope
    scope = @user.favorites.where(resource_type: "Group")

    policy_scope(Api::Users::Groups::FavoritesPolicy, scope)
  end
end
