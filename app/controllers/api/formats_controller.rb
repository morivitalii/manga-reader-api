class Api::FormatsController < Api::ApplicationController
  before_action :set_format, only: [:show, :update, :destroy]

  before_action -> { authorize(Api::FormatsPolicy) }, only: [:index, :create]
  before_action -> { authorize(Api::FormatsPolicy, format: @format) }, only: [:show, :update, :destroy]

  skip_after_action :verify_policy_scoped, only: [:create]
  
  def index
    query = format_scope.joins(tag: :translations).order("tag_translations.title ASC")
    cache_key = cache_key(query)

    formats = Rails.cache.fetch(cache_key) do
      formats = query.all

      ActiveRecord::Associations::Preloader.new.preload(
        formats, :tag, Tag.with_translations
      )

      formats = Api::FormatDecorator.decorate_collection(formats)
      
      Api::FormatSerializer.serialize(formats).to_json
    end

    render json: formats, status: 200
  end

  def show
    cache_key = cache_key(@format)

    format = Rails.cache.fetch(cache_key) do
      ActiveRecord::Associations::Preloader.new.preload(
        @format, :tag, Tag.with_translations
      )

      format = Api::FormatDecorator.decorate(@format)

      Api::FormatSerializer.serialize(format).to_json
    end

    render json: format, status: 200
  end

  def create
    service = Api::CreateFormat.new(create_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.format, [
        tag: Tag.translations_associations
      ]
      )

      format = Api::FormatDecorator.decorate(service.format)
      format = Api::FormatSerializer.serialize(format)

      render json: format, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def update
    service = Api::UpdateFormat.new(update_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.format, [
        tag: Tag.translations_associations
      ]
      )

      format = Api::FormatDecorator.decorate(service.format)
      format = Api::FormatSerializer.serialize(format)

      render json: format, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def destroy
    service = Api::DeleteFormat.new(format: @format)

    if service.call
      head 204
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_format
    @format = format_scope.find(params[:id])
  end

  def create_params
    permitted_attributes(Api::FormatsPolicy, :create)
  end

  def update_params
    permitted_attributes(Api::FormatsPolicy, :update).merge(format: @format)
  end

  def format_scope
    policy_scope(Api::FormatsPolicy, Format)
  end
end
