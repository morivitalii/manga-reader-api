class Api::InterfaceLanguagesController < Api::ApplicationController
  before_action :set_interface_language, only: [:show, :update, :destroy]

  before_action -> { authorize(Api::InterfaceLanguagesPolicy) }, only: [:index, :create]
  before_action -> { authorize(Api::InterfaceLanguagesPolicy, interface_language: @interface_language) }, only: [:show, :update, :destroy]

  skip_after_action :verify_policy_scoped, only: [:create]

  def index
    query = interface_languages_scope.order(id: :asc)
    cache_key = endpoint_cache_key(query)

    # Any change in this code block must be accompanied by thinking
    # about the cache invalidation with model associations
    interface_languages = Rails.cache.fetch(cache_key, expires_in: 24.hours) do
      interface_languages = query.all

      ActiveRecord::Associations::Preloader.new.preload(
        interface_languages, [
          InterfaceLanguage.translations_associations
        ]
      )

      interface_languages = Api::InterfaceLanguageDecorator.decorate_collection(interface_languages)

      Api::InterfaceLanguageSerializer.serialize(interface_languages).to_json
    end

    render json: interface_languages, status: 200
  end

  def show
    cache_key = endpoint_cache_key(@interface_language)

    # Any change in this code block must be accompanied by thinking
    # about the cache invalidation with model associations
    interface_language = Rails.cache.fetch(cache_key, expires_in: 24.hours) do
      ActiveRecord::Associations::Preloader.new.preload(
        @interface_language, [
          InterfaceLanguage.translations_associations
        ]
      )

      interface_language = Api::InterfaceLanguageDecorator.decorate(@interface_language)

      Api::InterfaceLanguageSerializer.serialize(interface_language).to_json
    end

    render json: interface_language, status: 200
  end

  def create
    service = Api::CreateInterfaceLanguage.new(create_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.interface_language, [
          InterfaceLanguage.translations_associations
        ]
      )

      interface_language = Api::InterfaceLanguageDecorator.decorate(service.interface_language)
      interface_language = Api::InterfaceLanguageSerializer.serialize(interface_language)

      render json: interface_language, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def update
    service = Api::UpdateInterfaceLanguage.new(update_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.interface_language, [
          InterfaceLanguage.translations_associations
        ]
      )

      interface_language = Api::InterfaceLanguageDecorator.decorate(service.interface_language)
      interface_language = Api::InterfaceLanguageSerializer.serialize(interface_language)

      render json: interface_language, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def destroy
    service = Api::DeleteInterfaceLanguage.new(interface_language: @interface_language)

    if service.call
      head 204
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_interface_language
    @interface_language = interface_languages_scope.find(params[:id])
  end

  def create_params
    permitted_attributes(Api::InterfaceLanguagesPolicy, :create)
  end

  def update_params
    permitted_attributes(Api::InterfaceLanguagesPolicy, :update).merge(interface_language: @interface_language)
  end

  def interface_languages_scope
    policy_scope(Api::InterfaceLanguagesPolicy, InterfaceLanguage)
  end
end
