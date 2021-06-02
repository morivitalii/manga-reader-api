class Api::ArtistsController < Api::ApplicationController
  include Pagination

  before_action :set_artist, only: [:show, :update, :destroy]

  before_action -> { authorize(Api::ArtistsPolicy) }, only: [:index, :create]
  before_action -> { authorize(Api::ArtistsPolicy, artist: @artist) }, only: [:show, :update, :destroy]

  skip_after_action :verify_policy_scoped, only: [:create]

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

  def create
    service = Api::CreateArtist.new(create_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.artist, [
          Artist.translations_associations
        ]
      )

      artist = Api::ArtistDecorator.decorate(service.artist)
      artist = Api::ArtistSerializer.serialize(artist)

      render json: artist, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def update
    service = Api::UpdateArtist.new(update_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.artist, [
          Artist.translations_associations
        ]
      )

      artist = Api::ArtistDecorator.decorate(service.artist)
      artist = Api::ArtistSerializer.serialize(artist)

      render json: artist, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def destroy
    service = Api::DeleteArtist.new(artist: @artist)

    if service.call
      head 204
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_artist
    @artist = artists_scope.find(params[:id])
  end

  def create_params
    permitted_attributes(Api::ArtistsPolicy, :create)
  end

  def update_params
    permitted_attributes(Api::ArtistsPolicy, :update).merge(artist: @artist)
  end

  def artists_scope
    policy_scope(Api::ArtistsPolicy, Artist)
  end
end
