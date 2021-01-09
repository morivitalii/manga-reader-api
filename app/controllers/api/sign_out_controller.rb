class Api::SignOutController < Api::ApplicationController
  skip_after_action :verify_policy_scoped, only: [:destroy]

  before_action -> { authorize(Api::SignOutPolicy) }, only: [:destroy]

  def destroy
    request.env["warden"].logout

    head :no_content
  end
end
