class Api::ThemesController < Api::ApplicationController
  before_action :set_theme, only: [:show, :update, :destroy]

  before_action -> { authorize(Api::ThemesPolicy) }, only: [:index, :create]
  before_action -> { authorize(Api::ThemesPolicy, theme: @theme) }, only: [:show, :update, :destroy]

  skip_after_action :verify_policy_scoped, only: [:create]

  def index
    query = themes_scope.joins(tag: :translations).order("tag_translations.title ASC")
    cache_key = endpoint_cache_key(query)

    # Any change in this code block must be accompanied by thinking
    # about the cache invalidation with model associations
    themes = Rails.cache.fetch(cache_key, expires_in: 24.hours) do
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
    cache_key = endpoint_cache_key(@theme)

    # Any change in this code block must be accompanied by thinking
    # about the cache invalidation with model associations
    theme = Rails.cache.fetch(cache_key, expires_in: 24.hours) do
      ActiveRecord::Associations::Preloader.new.preload(
        @theme, :tag, Tag.with_translations
      )

      theme = Api::ThemeDecorator.decorate(@theme)

      Api::ThemeSerializer.serialize(theme).to_json
    end

    render json: theme, status: 200
  end

  def create
    service = Api::CreateTheme.new(create_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.theme, [
          tag: Tag.translations_associations
        ]
      )

      theme = Api::ThemeDecorator.decorate(service.theme)
      theme = Api::ThemeSerializer.serialize(theme)

      render json: theme, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def update
    service = Api::UpdateTheme.new(update_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.theme, [
        tag: Tag.translations_associations
      ]
      )

      theme = Api::ThemeDecorator.decorate(service.theme)
      theme = Api::ThemeSerializer.serialize(theme)

      render json: theme, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def destroy
    service = Api::DeleteTheme.new(theme: @theme)

    if service.call
      head 204
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_theme
    @theme = themes_scope.find(params[:id])
  end

  def create_params
    permitted_attributes(Api::ThemesPolicy, :create)
  end

  def update_params
    permitted_attributes(Api::ThemesPolicy, :update).merge(theme: @theme)
  end

  def themes_scope
    policy_scope(Api::ThemesPolicy, Theme)
  end
end
