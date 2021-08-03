class Api::Users::Favorites::GroupsController < Api::ApplicationController
  before_action -> { authorize(Api::Users::Favorites::GroupsPolicy) }, only: [:index]
  before_action :set_user, only: [:index]

  def index
    groups = groups_scope.joins(:favorites).where(favorites: {user: @user}).order("favorites.updated_at DESC")
    groups = paginate_countless(groups)

    groups = Api::GroupDecorator.decorate(groups)
    groups = Api::GroupSerializer.serialize(groups)

    render json: groups, status: 200
  end

  private

  def set_user
    @user = Current.user
  end

  def groups_scope
    policy_scope(Api::Users::Favorites::GroupsPolicy, Group)
  end
end
