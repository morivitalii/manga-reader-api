class Api::CleanersController < Api::ApplicationController
  include Pagination

  before_action :set_cleaner, only: [:show]

  before_action -> { authorize(Api::CleanersPolicy, cleaner: @cleaner) }, only: [:show]

  def show
    cache_key = endpoint_cache_key(@cleaner)

    # Any change in this code block must be accompanied by thinking
    # about the cache invalidation with model associations
    cleaner = Rails.cache.fetch(cache_key, expires_in: 24.hours) do
      ActiveRecord::Associations::Preloader.new.preload(
        @cleaner, [
          artist: Artist.translations_associations
        ]
      )

      cleaner = Api::CleanerDecorator.decorate(@cleaner)

      Api::CleanerSerializer.serialize(cleaner).to_json
    end

    render json: cleaner, status: 200
  end

  private

  def set_cleaner
    @cleaner = cleaner_scope.find(params[:id])
  end

  def cleaner_scope
    policy_scope(Api::CleanersPolicy, Cleaner)
  end
end
