class Api::ContentLanguagesController < Api::ApplicationController
  before_action :set_content_language, only: [:show, :update, :destroy]

  before_action -> { authorize(Api::ContentLanguagesPolicy) }, only: [:index, :create]
  before_action -> { authorize(Api::ContentLanguagesPolicy, content_language: @content_language) }, only: [:show, :update, :destroy]

  skip_after_action :verify_policy_scoped, only: [:create]

  def index
    content_languages = content_languages_scope.order(id: :asc).all

    ActiveRecord::Associations::Preloader.new.preload(
      content_languages, [
        ContentLanguage.translations_associations
      ]
    )

    content_languages = Api::ContentLanguageDecorator.decorate_collection(content_languages)
    content_languages = Api::ContentLanguageSerializer.serialize(content_languages)

    render json: content_languages, status: 200
  end

  def show
    ActiveRecord::Associations::Preloader.new.preload(
      @content_language, [
        ContentLanguage.translations_associations
      ]
    )

    content_language = Api::ContentLanguageDecorator.decorate(@content_language)
    content_language = Api::ContentLanguageSerializer.serialize(content_language)

    render json: content_language, status: 200
  end

  def create
    service = Api::CreateContentLanguage.new(create_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.content_language, [
          ContentLanguage.translations_associations
        ]
      )

      content_language = Api::ContentLanguageDecorator.decorate(service.content_language)
      content_language = Api::ContentLanguageSerializer.serialize(content_language)

      render json: content_language, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def update
    service = Api::UpdateContentLanguage.new(update_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.content_language, [
          ContentLanguage.translations_associations
        ]
      )

      content_language = Api::ContentLanguageDecorator.decorate(service.content_language)
      content_language = Api::ContentLanguageSerializer.serialize(content_language)

      render json: content_language, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def destroy
    service = Api::DeleteContentLanguage.new(content_language: @content_language)

    if service.call
      head 204
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_content_language
    @content_language = content_languages_scope.find(params[:id])
  end

  def create_params
    permitted_attributes(Api::ContentLanguagesPolicy, :create)
  end

  def update_params
    permitted_attributes(Api::ContentLanguagesPolicy, :update).merge(content_language: @content_language)
  end

  def content_languages_scope
    policy_scope(Api::ContentLanguagesPolicy, ContentLanguage)
  end
end
