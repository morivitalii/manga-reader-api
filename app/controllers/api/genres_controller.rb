class Api::GenresController < Api::ApplicationController
  before_action :set_genre, only: [:show]
  before_action :set_genre_associations, only: [:show]

  before_action -> { authorize(Api::GenresPolicy) }, only: [:index]
  before_action -> { authorize(Api::GenresPolicy, @genre) }, only: [:show]

  def index
    genres = genres_scope.joins(tag: :translations).order("tag_translations.title ASC").all

    ActiveRecord::Associations::Preloader.new.preload(
      genres, :tag, Tag.with_translations
    )

    genres = Api::GenreDecorator.decorate_collection(genres)
    genres = Api::GenreSerializer.serialize(genres)

    render json: genres, status: 200
  end

  def show
    genre = Api::GenreDecorator.decorate(@genre)
    genre = Api::GenreSerializer.serialize(genre)

    render json: genre, status: 200
  end

  private

  def set_genre
    @genre = genres_scope.find(params[:id])
  end

  def genres_scope
    policy_scope(Api::GenresPolicy, Genre)
  end

  def set_genre_associations
    ActiveRecord::Associations::Preloader.new.preload(
      @genre, :tag, Tag.with_translations
    )
  end
end
