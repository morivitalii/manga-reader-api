class Api::TranslatorsController < Api::ApplicationController
  include Pagination

  before_action :set_translator, only: [:show]

  before_action -> { authorize(Api::TranslatorsPolicy) }, only: [:index]
  before_action -> { authorize(Api::TranslatorsPolicy, translator: @translator) }, only: [:show]

  def index
    translators = translator_scope.order(id: :asc)
    translators = paginate_countless(translators)

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
    cache_key = cache_key(@translator)

    translator = Rails.cache.fetch(cache_key) do
      ActiveRecord::Associations::Preloader.new.preload(
        @translator, [
          artist: Artist.translations_associations
        ]
      )

      translator = Api::TranslatorDecorator.decorate(@translator)

      Api::TranslatorSerializer.serialize(translator).to_json
    end

    render json: translator, status: 200
  end

  private

  def set_translator
    @translator = translator_scope.find(params[:id])
  end

  def translator_scope
    policy_scope(Api::TranslatorsPolicy, Translator)
  end
end
