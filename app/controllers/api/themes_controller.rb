class Api::ThemesController < Api::ApplicationController
  before_action :set_theme, only: [:show]

  before_action -> { authorize(Api::ThemesPolicy) }, only: [:index]
  before_action -> { authorize(Api::ThemesPolicy, @theme) }, only: [:show]

  def index
    query = themes_scope.joins(tag: :translations).order("tag_translations.title ASC")
    cache_key = cache_key(query)

    themes = Rails.cache.fetch(cache_key) do
      themes = query.all

      ActiveRecord::Associations::Preloader.new.preload(
        themes, :tag, Tag.with_translations
      )

      themes = Api::ThemeDecorator.decorate_collection(themes)
      Api::ThemeSerializer.serialize(themes).to_json
    end

    render json: themes, status: 200
  end

  def show
    cache_key = cache_key(@theme)

    theme = Rails.cache.fetch(cache_key) do
      ActiveRecord::Associations::Preloader.new.preload(
        @theme, :tag, Tag.with_translations
      )

      theme = Api::ThemeDecorator.decorate(@theme)

      Api::ThemeSerializer.serialize(theme).to_json
    end

    render json: theme, status: 200
  end

  private

  def set_theme
    @theme = themes_scope.find(params[:id])
  end

  def themes_scope
    policy_scope(Api::ThemesPolicy, Theme)
  end
end
