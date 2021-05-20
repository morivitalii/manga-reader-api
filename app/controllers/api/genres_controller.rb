class Api::GenresController < Api::ApplicationController
  before_action :set_genre, only: [:show, :update, :destroy]

  before_action -> { authorize(Api::GenresPolicy) }, only: [:index, :create]
  before_action -> { authorize(Api::GenresPolicy, genre: @genre) }, only: [:show, :update, :destroy]

  skip_after_action :verify_policy_scoped, only: [:create]

  def index
    query = genres_scope.joins(tag: :translations).order("tag_translations.title ASC")
    cache_key = endpoint_cache_key(query)

    genres = Rails.cache.fetch(cache_key) do
      genres = query.all

      ActiveRecord::Associations::Preloader.new.preload(
        genres, :tag, Tag.with_translations
      )

      genres = Api::GenreDecorator.decorate_collection(genres)

      Api::GenreSerializer.serialize(genres).to_json
    end

    render json: genres, status: 200
  end

  def show
    cache_key = endpoint_cache_key(@genre)

    genre = Rails.cache.fetch(cache_key) do
      ActiveRecord::Associations::Preloader.new.preload(
        @genre, :tag, Tag.with_translations
      )

      genre = Api::GenreDecorator.decorate(@genre)

      Api::GenreSerializer.serialize(genre).to_json
    end

    render json: genre, status: 200
  end

  def create
    service = Api::CreateGenre.new(create_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.genre, [
          tag: Tag.translations_associations
        ]
      )

      genre = Api::GenreDecorator.decorate(service.genre)
      genre = Api::GenreSerializer.serialize(genre)

      render json: genre, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def update
    service = Api::UpdateGenre.new(update_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.genre, [
          tag: Tag.translations_associations
        ]
      )

      genre = Api::GenreDecorator.decorate(service.genre)
      genre = Api::GenreSerializer.serialize(genre)

      render json: genre, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def destroy
    service = Api::DeleteGenre.new(genre: @genre)

    if service.call
      head 204
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_genre
    @genre = genres_scope.find(params[:id])
  end

  def create_params
    permitted_attributes(Api::GenresPolicy, :create)
  end

  def update_params
    permitted_attributes(Api::GenresPolicy, :update).merge(genre: @genre)
  end

  def genres_scope
    policy_scope(Api::GenresPolicy, Genre)
  end
end
