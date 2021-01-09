class Api::ContentLanguagesController < Api::ApplicationController
  before_action :set_content_language, only: [:show]
  before_action :set_content_language_associations, only: [:show]

  before_action -> { authorize(Api::ContentLanguagesPolicy) }, only: [:index]
  before_action -> { authorize(Api::ContentLanguagesPolicy, @content_language) }, only: [:show]

  def index
    content_languages = ContentLanguage.order(id: :asc).all
    content_languages = policy_scope(Api::ContentLanguagesPolicy, content_languages)

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
    @content_language = policy_scope(Api::ContentLanguagesPolicy, ContentLanguage).find(params[:id])
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
