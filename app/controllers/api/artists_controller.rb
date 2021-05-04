class Api::ArtistsController < Api::ApplicationController
  include Pagination

  before_action :set_artist, only: [:show]

  before_action -> { authorize(Api::ArtistsPolicy) }, only: [:index]
  before_action -> { authorize(Api::ArtistsPolicy, artist: @artist) }, only: [:show]

  def index
    artists = artists_scope.joins(:translations).order("artist_translations.name ASC").all
    artists = paginate_countless(artists)

    ActiveRecord::Associations::Preloader.new.preload(
      artists, [
        Artist.translations_associations
      ]
    )

    artists = Api::ArtistDecorator.decorate(artists)
    artists = Api::ArtistSerializer.serialize(artists)

    render json: artists, status: 200
  end

  def show
    ActiveRecord::Associations::Preloader.new.preload(
      @artist, [
        Artist.translations_associations
      ]
    )

    artist = Api::ArtistDecorator.decorate(@artist)
    artist = Api::ArtistSerializer.serialize(artist)

    render json: artist, status: 200
  end

  private

  def set_artist
    @artist = artists_scope.find(params[:id])
  end

  def artists_scope
    policy_scope(Api::ArtistsPolicy, Artist)
  end
end
