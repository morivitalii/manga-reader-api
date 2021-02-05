class Api::TranslatorsController < Api::ApplicationController
  include Pagination

  before_action :set_translator, only: [:show]
  before_action :set_translator_associations, only: [:show]

  before_action -> { authorize(Api::TranslatorsPolicy) }, only: [:index]
  before_action -> { authorize(Api::TranslatorsPolicy, @translator) }, only: [:show]

  def index
    translators = translator_scope.order(id: :asc)
    pagination, translators = paginate_countless(translators)

    set_pagination_headers(pagination)

    ActiveRecord::Associations::Preloader.new.preload(
      translators, [
        artist: Artist.translations_associations
      ]
    )

    translators = Api::TranslatorDecorator.decorate(translators)
    translators = Api::TranslatorSerializer.serialize(translators)

    render json: translators, status: 200
  end

  def show
    translator = Api::TranslatorDecorator.decorate(@translator)
    translator = Api::TranslatorSerializer.serialize(translator)

    render json: translator, status: 200
  end

  private

  def set_translator
    @translator = translator_scope.find(params[:id])
  end

  def translator_scope
    policy_scope(Api::TranslatorsPolicy, Translator)
  end

  def set_translator_associations
    ActiveRecord::Associations::Preloader.new.preload(
      @translator, [
        artist: Artist.translations_associations
      ]
    )
  end
end
