class Api::InterfaceLanguagesController < Api::ApplicationController
  before_action :set_interface_language, only: [:show]
  before_action :set_interface_language_associations, only: [:show]

  def index
    interface_languages = InterfaceLanguage.with_translations.includes(:locale).order(id: :asc).all

    interface_languages = Api::InterfaceLanguageDecorator.decorate_collection(interface_languages)

    render json: Api::InterfaceLanguageSerializer.serialize(interface_languages), status: 200
  end

  def show
    interface_language = Api::InterfaceLanguageDecorator.decorate(@interface_language)

    render json: Api::InterfaceLanguageSerializer.serialize(interface_language), status: 200
  end

  private

  def set_interface_language
    @interface_language = InterfaceLanguage.with_translations.find(params[:id])
  end

  def set_interface_language_associations
    ActiveRecord::Associations::Preloader.new.preload(@interface_language, :locale)
  end
end