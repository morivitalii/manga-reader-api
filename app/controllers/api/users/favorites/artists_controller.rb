class Api::Users::Favorites::ArtistsController < Api::ApplicationController
  include Pagination

  before_action -> { authorize(Api::Users::Favorites::ArtistsPolicy) }, only: [:index]
  before_action :set_user, only: [:index]

  def index
    artists = artists_scope.joins(:favorites).where(favorites: {user: @user}).order("favorites.updated_at DESC")
    pagination, artists = paginate_countless(artists)

    set_pagination_headers(pagination)

    ActiveRecord::Associations::Preloader.new.preload(
      artists, [
        Artist.translations_associations
      ]
    )

    artists = Api::ArtistDecorator.decorate(artists)
    artists = Api::ArtistSerializer.serialize(artists)

    render json: artists, status: 200
  end

  private

  def set_user
    @user = Current.user
  end

  def artists_scope
    policy_scope(Api::Users::Favorites::ArtistsPolicy, Artist)
  end
end
