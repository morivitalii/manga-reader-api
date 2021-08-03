class Api::UsersController < Api::ApplicationController
  before_action :set_user, only: [:show]

  before_action -> { authorize(Api::UsersPolicy) }, only: [:index]
  before_action -> { authorize(Api::UsersPolicy, user: @user) }, only: [:show]

  def index
    users = user_scope.order(username: :asc)
    users = paginate_countless(users)

    ActiveRecord::Associations::Preloader.new.preload(
      users, [
        :access_rights,
        user_setting: {
          avatar_attachment: :blob
        }
      ]
    )

    users = Api::UserDecorator.decorate(users)
    users = Api::UserSerializer.serialize(users)

    render json: users, status: 200
  end

  def show
    ActiveRecord::Associations::Preloader.new.preload(
      @user, [
        :access_rights,
        user_setting: {
          avatar_attachment: :blob
        }
      ]
    )

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
