class Web::ArtistsController < Web::ApplicationController
	before_action -> { authorize(Web::ArtistsPolicy) }, only: [:index, :new, :create]

	skip_after_action :verify_policy_scoped, only: [:new, :create]

	def index
		query = artists_scope.order(id: :desc)

		@pagy, @artists = pagy(query)

		ActiveRecord::Associations::Preloader.new.preload(
			@artists, [
				Artist.translations_associations
			]
		)
	end

	def new
		@service = Api::CreateArtist.new
	end

	def create
		@service = Api::CreateArtist.new(create_params)

		if @service.call
			redirect_to(artists_path)
		else
			render :new
		end
	end

	private

	def artists_scope
		policy_scope(Web::ArtistsPolicy, Artist)
	end

	def create_params
		permitted_attributes(Web::ArtistsPolicy, :create, :artist)
	end
end