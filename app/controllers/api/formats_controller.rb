class Api::FormatsController < Api::ApplicationController
  before_action :set_format, only: [:show]

  before_action -> { authorize(Api::FormatsPolicy) }, only: [:index]
  before_action -> { authorize(Api::FormatsPolicy, @format) }, only: [:show]

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

  private

  def set_format
    @format = format_scope.find(params[:id])
  end

  def format_scope
    policy_scope(Api::FormatsPolicy, Format)
  end
end
