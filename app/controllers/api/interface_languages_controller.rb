class Api::InterfaceLanguagesController < Api::ApplicationController
  before_action :set_interface_language, only: [:show]
  before_action :set_interface_language_associations, only: [:show]

  before_action -> { authorize(Api::InterfaceLanguagesPolicy) }, only: [:index]
  before_action -> { authorize(Api::InterfaceLanguagesPolicy, @interface_language) }, only: [:show]

  def index
    interface_languages = InterfaceLanguage.order(id: :asc).all

    ActiveRecord::Associations::Preloader.new.preload(
      interface_languages, [
        ContentLanguage.translations_associations,
        :locale
      ]
    )

    interface_languages = Api::InterfaceLanguageDecorator.decorate_collection(interface_languages)
    interface_languages = Api::InterfaceLanguageSerializer.serialize(interface_languages)

    render json: interface_languages, status: 200
  end

  def show
    interface_language = Api::InterfaceLanguageDecorator.decorate(@interface_language)
    interface_language = Api::InterfaceLanguageSerializer.serialize(interface_language)

    render json: interface_language, status: 200
  end

  private

  def set_interface_language
    @interface_language = InterfaceLanguage.find(params[:id])
  end

  def set_interface_language_associations
    ActiveRecord::Associations::Preloader.new.preload(
      @interface_language, [
        ContentLanguage.translations_associations,
        :locale
      ]
    )
  end
end
