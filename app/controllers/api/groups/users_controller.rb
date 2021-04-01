class Api::Groups::UsersController < Api::ApplicationController
  before_action :set_group, only: [:index, :show]
  before_action :set_group_user, only: [:show]

  before_action -> { authorize(Api::Groups::UsersPolicy) }, only: [:index]
  before_action -> { authorize(Api::Groups::UsersPolicy, @group_user) }, only: [:show]

  def index
    query = group_users_scope.order(id: :asc)
    cache_key = cache_key(query)

    group_users = Rails.cache.fetch(cache_key) do
      group_users = query.all

      ActiveRecord::Associations::Preloader.new.preload(
        group_users, [
          :user,
          :group_access_rights
        ]
      )

      group_users = Api::GroupUserDecorator.decorate_collection(group_users)

      Api::GroupUserSerializer.serialize(group_users).to_json
    end

    render json: group_users, status: 200
  end

  def show
    cache_key = cache_key(@group_user)

    group_user = Rails.cache.fetch(cache_key) do
      ActiveRecord::Associations::Preloader.new.preload(
        @group_user, [
          :user,
          :group_access_rights
        ]
      )

      group_user = Api::GroupUserDecorator.decorate(@group_user)

      Api::GroupUserSerializer.serialize(group_user).to_json
    end

    render json: group_user, status: 200
  end

  private

  def set_group
    @group = group_scope.find(params[:group_id])
  end

  def set_group_user
    @group_user = group_users_scope.find(params[:id])
  end

  def group_scope
    policy_scope(Api::GroupsPolicy, Group)
  end

  def group_users_scope
    policy_scope(Api::Groups::UsersPolicy, @group.group_users)
  end
end
