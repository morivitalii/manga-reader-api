class Api::FavoritesController < Api::ApplicationController
  include Pagination

  before_action :set_user, only: [:index]

  before_action -> { authorize(Api::FavoritesPolicy, user: @user) }, only: [:index]

  def index
    scope = favorites_scope.order(updated_at: :desc)
    service = Api::FilterFavorites.new(scope: scope, params: index_params)

    if service.call
      favorites = service.favorites

      # Apply pagination if filtering is not by ids
      unless index_params.resource_type_and_ids_context?
        favorites = paginate_countless(favorites)
      end

      favorites = Api::FavoriteDecorator.decorate(favorites)
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

  def favorites_scope
    policy_scope(Api::FavoritesPolicy, @user.favorites)
  end

  def index_params
    permitted_attributes = permitted_attributes(Api::FavoritesPolicy, :index)

    Api::Favorites::IndexParams.new(permitted_attributes)
  end
end
