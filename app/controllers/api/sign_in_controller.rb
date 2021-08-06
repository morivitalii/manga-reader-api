class Api::SignInController < Api::ApplicationController
  skip_after_action :verify_policy_scoped, only: [:create, :unauthenticated]

  before_action -> { authorize(Api::SignInPolicy) }, only: [:create, :unauthenticated]

  def create
    if request.env["warden"].authenticate!(:api_password)
      user = request.env["warden"].user
      Current.user = user

      ActiveRecord::Associations::Preloader.new.preload(
        user, [
          :access_rights,
          user_setting: {
            avatar_attachment: :blob
          }
        ]
      )

      user = Api::UserDecorator.decorate(user)
      user = Api::UserSerializer.serialize(user)

      render json: user, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def unauthenticated
    service = request.env["warden.options"][:service]

    render json: service.errors, status: 422
  end
end
