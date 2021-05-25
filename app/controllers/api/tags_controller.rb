class Api::TagsController < Api::ApplicationController
  before_action :set_tag, only: [:show]

  before_action -> { authorize(Api::TagsPolicy) }, only: [:index]
  before_action -> { authorize(Api::TagsPolicy, tag: @tag) }, only: [:show]

  def index
    query = tag_scope.joins(:translations).order("tag_translations.title ASC")
    cache_key = endpoint_cache_key(query)

    # Any change in this code block must be accompanied by thinking
    # about the cache invalidation with model associations
    tags = Rails.cache.fetch(cache_key, expires_in: 24.hours) do
      tags = query.all

      ActiveRecord::Associations::Preloader.new.preload(
        tags, Tag.translations_associations
      )

      tags = Api::TagDecorator.decorate_collection(tags)

      Api::TagSerializer.serialize(tags).to_json
    end

    render json: tags, status: 200
  end

  def show
    cache_key = endpoint_cache_key(@tag)

    # Any change in this code block must be accompanied by thinking
    # about the cache invalidation with model associations
    tag = Rails.cache.fetch(cache_key, expires_in: 24.hours) do
      ActiveRecord::Associations::Preloader.new.preload(
        @tag, Tag.translations_associations
      )

      tag = Api::TagDecorator.decorate(@tag)

      Api::TagSerializer.serialize(tag).to_json
    end

    render json: tag, status: 200
  end

  private

  def set_tag
    @tag = tag_scope.find(params[:id])
  end

  def tag_scope
    policy_scope(Api::TagsPolicy, Tag)
  end
end
