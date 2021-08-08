class Web::ArtistsController < Web::ApplicationController
	before_action -> { authorize(Web::ArtistsPolicy) }, only: [:new, :create]

	skip_after_action :verify_policy_scoped, only: [:new, :create]

	def new
		@service = Api::CreateArtist.new

		render :new
	end

	def create
		@service = Api::CreateArtist.new(create_params)

		if @service.call
			redirect_to(root_path)
		else
			render :new
		end
	end

	private

	def create_params
		permitted_attributes(Web::ArtistsPolicy, :create, :artist)
	end
end