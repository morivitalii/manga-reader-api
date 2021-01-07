class Api::SignUpController < Api::ApplicationController
  before_action -> { authorize(Api::SignUpPolicy) }, only: [:create]

  def create
    service = Api::SignUp.new(create_params)

    if service.call
      request.env["warden"].set_user(service.user)

      render json: Api::UserSerializer.new(service.user)
    else
      render json: service.errors, status: :unprocessable_entity
    end
  end

  private

  def create_params
    permitted_attributes(Api::SignUpPolicy, :create)
  end
end
