class Api::ContentLanguagesController < Api::ApplicationController
  before_action :set_content_language, only: [:show]
  before_action :set_content_language_associations, only: [:show]

  def index
    content_languages = ContentLanguage.with_translations.includes(:locale).order(id: :asc).all

    content_languages = Api::ContentLanguageDecorator.decorate_collection(content_languages)

    render json: Api::ContentLanguageSerializer.serialize(content_languages), status: 200
  end

  def show
    content_language = Api::ContentLanguageDecorator.decorate(@content_language)

    render json: Api::ContentLanguageSerializer.serialize(content_language), status: 200
  end

  private

  def set_content_language
    @content_language = ContentLanguage.with_translations.find(params[:id])
  end

  def set_content_language_associations
    ActiveRecord::Associations::Preloader.new.preload(@content_language, :locale)
  end
end