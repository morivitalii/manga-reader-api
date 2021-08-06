class Web::SignInController < Web::ApplicationController
	before_action -> { authorize(Web::SignInPolicy) }, only: [:new, :create, :unauthenticated]

	skip_before_action :verify_authenticity_token, only: [:unauthenticated]
	skip_after_action :verify_policy_scoped, only: [:new, :create, :unauthenticated]

	def new
		@service = Api::SignIn.new

		render :new
	end

	def create
		@service = Api::SignIn.new(create_params)

		if request.env["warden"].authenticate!(:web_password)
			request.env["warden"].set_user(@service.user)

			redirect_to(root_path)
		else
			render :new
		end
	end

	def unauthenticated
		@service = request.env["warden.options"][:service]

		render :new
	end

	private

	def create_params
		permitted_attributes(Web::SignInPolicy, :create, :sign_in)
	end
end