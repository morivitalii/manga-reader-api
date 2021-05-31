class Api::SignUpController < Api::ApplicationController
  skip_after_action :verify_policy_scoped, only: [:create]

  before_action -> { authorize(Api::SignUpPolicy) }, only: [:create]

  def create
    service = Api::SignUp.new(create_params)

    if service.call
      request.env["warden"].set_user(service.user)

      ActiveRecord::Associations::Preloader.new.preload(
        service.user, [
          :access_rights,
          user_setting: {
            avatar_attachment: :blob
          }
        ]
      )

      user = Api::UserDecorator.decorate(service.user)
      user = Api::UserSerializer.serialize(user)

      render json: user, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  private

  def create_params
    permitted_attributes(Api::SignUpPolicy, :create)
  end
end
