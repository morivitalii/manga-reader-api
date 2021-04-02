class Api::GroupsController < Api::ApplicationController
  include Pagination

  before_action :set_group, only: [:show, :update]

  before_action -> { authorize(Api::GroupsPolicy) }, only: [:index, :create]
  before_action -> { authorize(Api::GroupsPolicy, group: @group) }, only: [:show, :update]

  skip_after_action :verify_policy_scoped, only: [:create]

  def index
    groups = group_scope.order("groups.title ASC").all
    pagination, groups = paginate_countless(groups)

    set_pagination_headers(pagination)

    groups = Api::GroupDecorator.decorate_collection(groups)
    groups = Api::GroupSerializer.serialize(groups)

    render json: groups, status: 200
  end

  def show
    group = Api::GroupDecorator.decorate(@group)
    group = Api::GroupSerializer.serialize(group)

    render json: group, status: 200
  end

  def create
    service = Api::CreateGroup.new(create_params)

    if service.call
      group = Api::GroupDecorator.decorate(service.group)
      group = Api::GroupSerializer.serialize(group)

      render json: group, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def update
    service = Api::UpdateGroup.new(update_params)

    if service.call
      group = Api::GroupDecorator.decorate(service.group)
      group = Api::GroupSerializer.serialize(group)

      render json: group, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_group
    @group = group_scope.find(params[:id])
  end

  def create_params
    permitted_attributes(Api::GroupsPolicy, :create).merge(user: Current.user)
  end

  def update_params
    permitted_attributes(Api::GroupsPolicy, :create).merge(group: @group)
  end

  def group_scope
    policy_scope(Api::GroupsPolicy, Group)
  end
end
