class Api::GroupsController < Api::ApplicationController
  include Pagination

  before_action :set_group, only: [:show]

  before_action -> { authorize(Api::GroupsPolicy) }, only: [:index]
  before_action -> { authorize(Api::GroupsPolicy, @group) }, only: [:show]

  def index
    groups = Group.order("title ASC").all
    groups = policy_scope(Api::GroupsPolicy, groups)
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

  private

  def set_group
    @group = policy_scope(Api::GroupsPolicy, Group).find(params[:id])
  end
end
