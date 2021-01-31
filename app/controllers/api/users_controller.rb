class Api::UsersController < Api::ApplicationController
  include Pagination

  before_action :set_user, only: [:show]

  before_action -> { authorize(Api::UsersPolicy) }, only: [:index]
  before_action -> { authorize(Api::UsersPolicy, @user) }, only: [:show]

  def index
    users = user_scope.order(username: :asc)
    pagination, users = paginate_countless(users)

    set_pagination_headers(pagination)

    users = Api::UserDecorator.decorate(users)
    users = Api::UserSerializer.serialize(users)

    render json: users, status: 200
  end

  def show
    user = Api::UserDecorator.decorate(@user)
    user = Api::UserSerializer.serialize(user)

    render json: user, status: 200
  end

  private

  def set_user
    @user = user_scope.find(params[:id])
  end

  def user_scope
    policy_scope(Api::UsersPolicy, User)
  end
end
