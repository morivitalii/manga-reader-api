class Api::GroupsController < Api::ApplicationController
  include Pagination

  before_action -> { authorize(Api::GroupsPolicy) }, only: [:index]

  def index
    groups = Group.order("title ASC").all
    pagination, groups = paginate_countless(groups)

    set_pagination_headers(pagination)

    groups = Api::GroupDecorator.decorate_collection(groups)
    groups = Api::GroupSerializer.serialize(groups)

    render json: groups, status: 200
  end
end
