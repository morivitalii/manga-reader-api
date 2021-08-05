class Web::HomeController < Web::ApplicationController
	before_action -> { authorize(Web::HomePolicy) }, only: [:index]

	skip_after_action :verify_policy_scoped, only: [:index]

	def index
		render :index
	end
end