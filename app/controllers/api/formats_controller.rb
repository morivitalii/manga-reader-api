class Api::FormatsController < Api::ApplicationController
  before_action :set_format, only: [:show]
  before_action :set_format_associations, only: [:show]

  before_action -> { authorize(Api::FormatsPolicy) }, only: [:index]
  before_action -> { authorize(Api::FormatsPolicy, @format) }, only: [:show]

  def index
    formats = Format.joins(tag: :translations).order("tag_translations.title ASC").all

    ActiveRecord::Associations::Preloader.new.preload(
      formats, :tag, Tag.with_translations
    )

    formats = Api::FormatDecorator.decorate_collection(formats)
    formats = Api::FormatSerializer.serialize(formats)

    render json: formats, status: 200
  end

  def show
    format = Api::FormatDecorator.decorate(@format)
    format = Api::FormatSerializer.serialize(format)

    render json: format, status: 200
  end

  private

  def set_format
    @format = Format.find(params[:id])
  end

  def set_format_associations
    ActiveRecord::Associations::Preloader.new.preload(
      @format, :tag, Tag.with_translations
    )
  end
end
