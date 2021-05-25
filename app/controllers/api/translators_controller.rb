class Api::TranslatorsController < Api::ApplicationController
  include Pagination

  before_action :set_translator, only: [:show]

  before_action -> { authorize(Api::TranslatorsPolicy, translator: @translator) }, only: [:show]

  def show
    cache_key = endpoint_cache_key(@translator)

    # Any change in this code block must be accompanied by thinking
    # about the cache invalidation with model associations
    translator = Rails.cache.fetch(cache_key, expires_in: 24.hours) do
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
