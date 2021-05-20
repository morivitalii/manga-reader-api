class Api::CleanersController < Api::ApplicationController
  include Pagination

  before_action :set_cleaner, only: [:show]

  before_action -> { authorize(Api::CleanersPolicy) }, only: [:index]
  before_action -> { authorize(Api::CleanersPolicy, cleaner: @cleaner) }, only: [:show]

  def index
    cleaners = cleaner_scope.order(id: :asc)
    cleaners = paginate_countless(cleaners)

    ActiveRecord::Associations::Preloader.new.preload(
      cleaners, [
        artist: Artist.translations_associations
      ]
    )

    cleaners = Api::CleanerDecorator.decorate(cleaners)
    cleaners = Api::CleanerSerializer.serialize(cleaners)

    render json: cleaners, status: 200
  end

  def show
    cache_key = endpoint_cache_key(@cleaner)

    cleaner = Rails.cache.fetch(cache_key) do
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
