class Api::UsersController < Api::ApplicationController
  include Pagination

  before_action -> { authorize(Api::UsersPolicy) }, only: [:index]

  def index
    users = User.order(username: :asc).all
    pagination, users = paginate_countless(users)

    users = Api::UserDecorator.decorate(users)
    users = Api::UserSerializer.serialize(users)

    set_pagination_headers(pagination)

    render json: users, status: 200
  end
end
