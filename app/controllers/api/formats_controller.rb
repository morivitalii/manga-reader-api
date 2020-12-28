class Api::FormatsController < Api::ApplicationController
  before_action :set_format, only: [:show]
  before_action :set_format_associations, only: [:show]

  def index
    formats = Format.joins(tag: :translations).order("tag_translations.title ASC").all

    ActiveRecord::Associations::Preloader.new.preload(
      formats, :tag, Tag.with_translations
    )

    formats = Api::FormatDecorator.decorate_collection(formats)

    render json: Api::FormatSerializer.serialize(formats), status: 200
  end

  def show
    format = Api::FormatDecorator.decorate(@format)

    render json: Api::FormatSerializer.serialize(format), status: 200
  end

  private

  def set_format
    @format = Format.find(params[:id])
  end

  def set_format_associations
    ActiveRecord::Associations::Preloader.new.preload(
      @format,
      [
        tag: [
          translations: [
            content_language: :locale
          ]
        ]
      ]
    )
  end
end