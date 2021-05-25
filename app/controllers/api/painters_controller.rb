class Api::PaintersController < Api::ApplicationController
  include Pagination

  before_action :set_painter, only: [:show]

  before_action -> { authorize(Api::PaintersPolicy, painter: @painter) }, only: [:show]

  def show
    cache_key = endpoint_cache_key(@painter)

    # Any change in this code block must be accompanied by thinking
    # about the cache invalidation with model associations
    painter = Rails.cache.fetch(cache_key, expires_in: 24.hours) do
      ActiveRecord::Associations::Preloader.new.preload(
        @painter, [
          artist: Artist.translations_associations
        ]
      )

      painter = Api::PainterDecorator.decorate(@painter)

      Api::PainterSerializer.serialize(painter).to_json
    end

    render json: painter, status: 200
  end

  private

  def set_painter
    @painter = painter_scope.find(params[:id])
  end

  def painter_scope
    policy_scope(Api::PaintersPolicy, Painter)
  end
end
