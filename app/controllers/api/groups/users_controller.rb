class Api::Groups::UsersController < Api::ApplicationController
  before_action :set_group, only: [:index, :show, :create, :update, :destroy]
  before_action :set_group_user, only: [:show, :update, :destroy]

  before_action -> { authorize(Api::Groups::UsersPolicy) }, only: [:index]
  before_action -> { authorize(Api::Groups::UsersPolicy, group: @group) }, only: [:create]
  before_action -> { authorize(Api::Groups::UsersPolicy, group_user: @group_user) }, only: [:show]
  before_action -> { authorize(Api::Groups::UsersPolicy, group: @group, group_user: @group_user) }, only: [:update, :destroy]

  def index
    group_users = group_users_scope.order(id: :asc).all

    ActiveRecord::Associations::Preloader.new.preload(
      group_users, [
        :group,
        :group_access_rights,
        user: {
          user_setting: {
            avatar_attachment: :blob
          }
        }
      ]
    )

    group_users = Api::GroupUserDecorator.decorate_collection(group_users)
    group_users = Api::GroupUserSerializer.serialize(group_users)

    render json: group_users, status: 200
  end

  def show
    ActiveRecord::Associations::Preloader.new.preload(
      @group_user, [
        :group,
        :group_access_rights,
        user: {
          user_setting: {
            avatar_attachment: :blob
          }
        }
      ]
    )

    group_user = Api::GroupUserDecorator.decorate(@group_user)
    group_user = Api::GroupUserSerializer.serialize(group_user)

    render json: group_user, status: 200
  end

  def create
    service = Api::Groups::CreateUser.new(create_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.group_user, [
          :group,
          :group_access_rights,
          user: {
            user_setting: {
              avatar_attachment: :blob
            }
          }
        ]
      )

      group_user = Api::GroupUserDecorator.decorate(service.group_user)
      group_user = Api::GroupUserSerializer.serialize(group_user)

      render json: group_user, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def update
    service = Api::Groups::UpdateUser.new(update_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.group_user, [
          :group,
          :group_access_rights,
          user: {
            user_setting: {
              avatar_attachment: :blob
            }
          }
        ]
      )

      group_user = Api::GroupUserDecorator.decorate(service.group_user)
      group_user = Api::GroupUserSerializer.serialize(group_user)

      render json: group_user, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def destroy
    service = Api::Groups::DeleteUser.new(group_user: @group_user)

    if service.call
      head 204
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_group
    @group = group_scope.find(params[:group_id])
  end

  def set_group_user
    @group_user = group_users_scope.find(params[:id])
  end

  def create_params
    permitted_attributes(Api::Groups::UsersPolicy, :create).merge(group: @group)
  end

  def update_params
    permitted_attributes(Api::Groups::UsersPolicy, :update).merge(group_user: @group_user)
  end

  def group_scope
    policy_scope(Api::GroupsPolicy, Group)
  end

  def group_users_scope
    policy_scope(Api::Groups::UsersPolicy, @group.group_users)
  end
end
