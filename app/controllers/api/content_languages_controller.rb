class Api::ContentLanguagesController < Api::ApplicationController
  before_action :set_content_language, only: [:show]
  before_action :set_content_language_associations, only: [:show]

  def index
    content_languages = ContentLanguage.order(id: :asc).all

    ActiveRecord::Associations::Preloader.new.preload(
      content_languages, [
        ContentLanguage.translations_associations,
        :locale
      ]
    )

    content_languages = Api::ContentLanguageDecorator.decorate_collection(content_languages)
    content_languages = Api::ContentLanguageSerializer.serialize(content_languages)

    render json: content_languages, status: 200
  end

  def show
    content_language = Api::ContentLanguageDecorator.decorate(@content_language)
    content_language = Api::ContentLanguageSerializer.serialize(content_language)

    render json: content_language, status: 200
  end

  private

  def set_content_language
    @content_language = ContentLanguage.find(params[:id])
  end

  def set_content_language_associations
    ActiveRecord::Associations::Preloader.new.preload(
      @content_language, [
        ContentLanguage.translations_associations,
        :locale
      ]
    )
  end
end