class Api::ThemesController < Api::ApplicationController
  before_action :set_theme, only: [:show]
  before_action :set_theme_associations, only: [:show]

  before_action -> { authorize(Api::ThemesPolicy) }, only: [:index]
  before_action -> { authorize(Api::ThemesPolicy, @theme) }, only: [:show]

  def index
    themes = themes_scope.joins(tag: :translations).order("tag_translations.title ASC").all

    ActiveRecord::Associations::Preloader.new.preload(
      themes, :tag, Tag.with_translations
    )

    themes = Api::ThemeDecorator.decorate_collection(themes)
    themes = Api::ThemeSerializer.serialize(themes)

    render json: themes, status: 200
  end

  def show
    theme = Api::ThemeDecorator.decorate(@theme)
    theme = Api::ThemeSerializer.serialize(theme)

    render json: theme, status: 200
  end

  private

  def set_theme
    @theme = themes_scope.find(params[:id])
  end

  def themes_scope
    policy_scope(Api::ThemesPolicy, Theme)
  end

  def set_theme_associations
    ActiveRecord::Associations::Preloader.new.preload(
      @theme, :tag, Tag.with_translations
    )
  end
end
