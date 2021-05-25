class Api::Tags::TranslationsController < Api::ApplicationController
  before_action :set_tag, only: [:show]

  before_action -> { authorize(Api::Tags::TranslationsPolicy, tag: @tag) }, only: [:show]

  def show
    cache_key = endpoint_cache_key(@tag)

    # Any change in this code block must be accompanied by thinking
    # about the cache invalidation with model associations
    tag = Rails.cache.fetch(cache_key, expires_in: 24.hours) do
      ActiveRecord::Associations::Preloader.new.preload(
        @tag, Tag.translations_associations
      )

      tag = Api::TagDecorator.decorate(@tag)

      Api::TranslationSerializer.serialize(tag).to_json
    end

    render json: tag, status: 200
  end

  private

  def set_tag
    @tag = policy_scope(Api::Tags::TranslationsPolicy, Tag).find(params[:tag_id])
  end
end
