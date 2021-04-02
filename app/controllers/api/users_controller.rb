class Api::UsersController < Api::ApplicationController
  include Pagination

  before_action :set_user, only: [:show]

  before_action -> { authorize(Api::UsersPolicy) }, only: [:index]
  before_action -> { authorize(Api::UsersPolicy, user: @user) }, only: [:show]

  def index
    users = user_scope.order(username: :asc)
    pagination, users = paginate_countless(users)

    set_pagination_headers(pagination)

    ActiveRecord::Associations::Preloader.new.preload(
      users, [
        user_setting: [
          avatar_attachment: :blob
        ]
      ]
    )

    users = Api::UserDecorator.decorate(users)
    users = Api::UserSerializer.serialize(users)

    render json: users, status: 200
  end

  def show
    cache_key = cache_key(@user)

    user = Rails.cache.fetch(cache_key) do
      ActiveRecord::Associations::Preloader.new.preload(
        @user, [
          user_setting: [
            avatar_attachment: :blob
          ]
        ]
      )

      user = Api::UserDecorator.decorate(@user)

      Api::UserSerializer.serialize(user).to_json
    end

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
