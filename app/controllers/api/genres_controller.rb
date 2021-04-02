class Api::GenresController < Api::ApplicationController
  before_action :set_genre, only: [:show]

  before_action -> { authorize(Api::GenresPolicy) }, only: [:index]
  before_action -> { authorize(Api::GenresPolicy, genre: @genre) }, only: [:show]

  def index
    query = genres_scope.joins(tag: :translations).order("tag_translations.title ASC")
    cache_key = cache_key(query)

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
    cache_key = cache_key(@genre)

    genre = Rails.cache.fetch(cache_key) do
      ActiveRecord::Associations::Preloader.new.preload(
        @genre, :tag, Tag.with_translations
      )

      genre = Api::GenreDecorator.decorate(@genre)

      Api::GenreSerializer.serialize(genre).to_json
    end

    render json: genre, status: 200
  end

  private

  def set_genre
    @genre = genres_scope.find(params[:id])
  end

  def genres_scope
    policy_scope(Api::GenresPolicy, Genre)
  end
end
