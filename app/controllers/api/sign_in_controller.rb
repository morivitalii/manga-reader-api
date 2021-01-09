class Api::SignInController < Api::ApplicationController
  skip_after_action :verify_policy_scoped, only: [:create, :unauthenticated]

  before_action -> { authorize(Api::SignInPolicy) }, only: [:create, :unauthenticated]

  def create
    if request.env["warden"].authenticate!(:password)
      user = Api::UserDecorator.decorate(current_user)
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
