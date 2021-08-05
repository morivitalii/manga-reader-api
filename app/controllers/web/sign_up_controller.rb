class Web::SignUpController < Web::ApplicationController
	before_action -> { authorize(Web::SignUpPolicy) }, only: [:new, :create]

	skip_after_action :verify_policy_scoped, only: [:new, :create]

	def new
		@service = Api::SignUp.new

		render :new
	end

	def create
		@service = Api::SignUp.new(create_params)

		if @service.call
			request.env["warden"].set_user(@service.user)

			redirect_to(root_path)
		else
			render :new
		end
	end

	private

	def create_params
		permitted_attributes(Web::SignUpPolicy, :create, :sign_up)
	end
end