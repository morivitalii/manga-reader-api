class Api::PaintersController < Api::ApplicationController
  include Pagination

  before_action :set_painter, only: [:show]

  before_action -> { authorize(Api::PaintersPolicy) }, only: [:index]
  before_action -> { authorize(Api::PaintersPolicy, painter: @painter) }, only: [:show]

  def index
    painters = painter_scope.order(id: :asc)
    painters = paginate_countless(painters)

    ActiveRecord::Associations::Preloader.new.preload(
      painters, [
        artist: Artist.translations_associations
      ]
    )

    painters = Api::PainterDecorator.decorate(painters)
    painters = Api::PainterSerializer.serialize(painters)

    render json: painters, status: 200
  end

  def show
    cache_key = endpoint_cache_key(@painter)

    painter = Rails.cache.fetch(cache_key) do
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
