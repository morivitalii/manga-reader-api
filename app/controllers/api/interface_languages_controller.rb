class Api::InterfaceLanguagesController < Api::ApplicationController
  before_action :set_interface_language, only: [:show]

  before_action -> { authorize(Api::InterfaceLanguagesPolicy) }, only: [:index]
  before_action -> { authorize(Api::InterfaceLanguagesPolicy, interface_language: @interface_language) }, only: [:show]

  def index
    query = interface_languages_scope.order(id: :asc)
    cache_key = endpoint_cache_key(query)

    interface_languages = Rails.cache.fetch(cache_key) do
      interface_languages = query.all

      ActiveRecord::Associations::Preloader.new.preload(
        interface_languages, [
          InterfaceLanguage.translations_associations,
          :locale
        ]
      )

      interface_languages = Api::InterfaceLanguageDecorator.decorate_collection(interface_languages)

      Api::InterfaceLanguageSerializer.serialize(interface_languages).to_json
    end

    render json: interface_languages, status: 200
  end

  def show
    cache_key = endpoint_cache_key(@interface_language)

    interface_language = Rails.cache.fetch(cache_key) do
      ActiveRecord::Associations::Preloader.new.preload(
        @interface_language, [
          InterfaceLanguage.translations_associations,
          :locale
        ]
      )

      interface_language = Api::InterfaceLanguageDecorator.decorate(@interface_language)

      Api::InterfaceLanguageSerializer.serialize(interface_language).to_json
    end

    render json: interface_language, status: 200
  end

  private

  def set_interface_language
    @interface_language = interface_languages_scope.find(params[:id])
  end

  def interface_languages_scope
    policy_scope(Api::InterfaceLanguagesPolicy, InterfaceLanguage)
  end
end
