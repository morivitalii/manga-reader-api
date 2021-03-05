class Api::Titles::FavoritesController < Api::ApplicationController
  before_action :set_title, only: [:create, :destroy]
  before_action :set_favorite, only: [:destroy]
  before_action -> { authorize(Api::Titles::FavoritesPolicy) }, only: [:create]
  before_action -> { authorize(Api::Titles::FavoritesPolicy, @favorite) }, only: [:destroy]

  def create
    service = Api::Titles::CreateFavorite.new(title: @title, user: Current.user)

    if service.call
      favorite = Api::FavoriteDecorator.decorate(service.favorite)
      favorite = Api::FavoriteSerializer.serialize(favorite)

      render json: favorite, status: 200
    else
      head 422
    end
  end

  def destroy
    service = Api::Titles::DeleteFavorite.new(favorite: @favorite)

    if service.call
      head 204
    else
      head 422
    end
  end

  private

  def set_title
    @title = titles_scope.find(params[:title_id])
  end

  def set_favorite
    @favorite = favorites_scope.find(params[:id])
  end

  def titles_scope
    policy_scope(Api::TitlesPolicy, Title)
  end

  def favorites_scope
    policy_scope(Api::Titles::FavoritesPolicy, @title.favorites)
  end
end
