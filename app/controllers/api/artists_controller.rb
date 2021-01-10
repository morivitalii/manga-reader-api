class Api::ArtistsController < Api::ApplicationController
  include Pagination

  before_action :set_artist, only: [:show]
  before_action :set_artist_associations, only: [:show]

  before_action -> { authorize(Api::ArtistsPolicy) }, only: [:index]
  before_action -> { authorize(Api::ArtistsPolicy, @artist) }, only: [:show]

  def index
    artists = Artist.joins(:translations).order("artist_translations.name ASC").all
    artists = policy_scope(Api::ArtistsPolicy, artists)
    pagination, artists = paginate_countless(artists)

    set_pagination_headers(pagination)

    ActiveRecord::Associations::Preloader.new.preload(
      artists, [
        Artist.translations_associations,
        :user
      ]
    )

    artists = Api::ArtistDecorator.decorate(artists)
    artists = Api::ArtistSerializer.serialize(artists)

    render json: artists, status: 200
  end

  def show
    artist = Api::ArtistDecorator.decorate(@artist)
    artist = Api::ArtistSerializer.serialize(artist)

    render json: artist, status: 200
  end

  private

  def set_artist
    @artist = policy_scope(Api::ArtistsPolicy, Artist).find(params[:id])
  end

  def set_artist_associations
    ActiveRecord::Associations::Preloader.new.preload(
      @artist, [
        Artist.translations_associations,
        :user
      ]
    )
  end
end
