class Web::SignOutController < Web::ApplicationController
	before_action -> { authorize(Web::SignOutPolicy) }, only: [:destroy]

	skip_after_action :verify_policy_scoped, only: [:destroy]

	def destroy
		request.env["warden"].logout

		redirect_to(root_path)
	end
end