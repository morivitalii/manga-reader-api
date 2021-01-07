class Api::UsersController < Api::ApplicationController
  include Pagination

  before_action :set_user, only: [:show]

  before_action -> { authorize(Api::UsersPolicy) }, only: [:index]
  before_action -> { authorize(Api::UsersPolicy, @user) }, only: [:show]

  def index
    users = User.order(username: :asc).all
    pagination, users = paginate_countless(users)

    users = Api::UserDecorator.decorate(users)
    users = Api::UserSerializer.serialize(users)

    set_pagination_headers(pagination)

    render json: users, status: 200
  end

  def show
    user = Api::UserDecorator.decorate(@user)
    user = Api::UserSerializer.serialize(user)

    render json: user, status: 200
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
