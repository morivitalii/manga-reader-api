class Api::Groups::FavoritesController < Api::ApplicationController
  before_action :set_group, only: [:create, :destroy]
  before_action :set_favorite, only: [:destroy]
  before_action -> { authorize(Api::Groups::FavoritesPolicy) }, only: [:create]
  before_action -> { authorize(Api::Groups::FavoritesPolicy, favorite: @favorite) }, only: [:destroy]

  def create
    service = Api::Groups::CreateFavorite.new(group: @group, user: Current.user)

    if service.call
      favorite = Api::FavoriteDecorator.decorate(service.favorite)
      favorite = Api::FavoriteSerializer.serialize(favorite)

      render json: favorite, status: 200
    else
      head 422
    end
  end

  def destroy
    service = Api::Groups::DeleteFavorite.new(favorite: @favorite)

    if service.call
      head 204
    else
      head 422
    end
  end

  private

  def set_group
    @group = groups_scope.find(params[:group_id])
  end

  def set_favorite
    @favorite = favorites_scope.find(params[:id])
  end

  def groups_scope
    policy_scope(Api::GroupsPolicy, Group)
  end

  def favorites_scope
    policy_scope(Api::Groups::FavoritesPolicy, @group.favorites)
  end
end
