class Api::LocalesController < Api::ApplicationController
  before_action :set_locale, only: [:show, :destroy]

  before_action -> { authorize(Api::LocalesPolicy) }, only: [:index, :create]
  before_action -> { authorize(Api::LocalesPolicy, locale: @locale) }, only: [:show, :destroy]

  skip_after_action :verify_policy_scoped, only: [:create]

  def index
    locales = locale_scope.order(id: :asc).all

    locales = Api::LocaleDecorator.decorate_collection(locales)
    locales = Api::LocaleSerializer.serialize(locales)

    render json: locales, status: 200
  end

  def show
    locale = Api::LocaleDecorator.decorate(@locale)
    locale = Api::LocaleSerializer.serialize(locale)

    render json: locale, status: 200
  end

  def create
    service = Api::CreateLocale.new(create_params)

    if service.call
      locale = Api::LocaleDecorator.decorate(service.locale)
      locale = Api::LocaleSerializer.serialize(locale)

      render json: locale, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def destroy
    service = Api::DeleteLocale.new(locale: @locale)

    if service.call
      head 204
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_locale
    @locale = locale_scope.find(params[:id])
  end

  def create_params
    permitted_attributes(Api::LocalesPolicy, :create)
  end

  def locale_scope
    policy_scope(Api::LocalesPolicy, Locale)
  end
end
