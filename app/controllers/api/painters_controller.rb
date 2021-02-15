class Api::PaintersController < Api::ApplicationController
  include Pagination

  before_action :set_painter, only: [:show]
  before_action :set_painter_associations, only: [:show]

  before_action -> { authorize(Api::PaintersPolicy) }, only: [:index]
  before_action -> { authorize(Api::PaintersPolicy, @painter) }, only: [:show]

  def index
    painters = painter_scope.order(id: :asc)
    pagination, painters = paginate_countless(painters)

    set_pagination_headers(pagination)

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
    painter = Api::PainterDecorator.decorate(@painter)
    painter = Api::PainterSerializer.serialize(painter)

    render json: painter, status: 200
  end

  private

  def set_painter
    @painter = painter_scope.find(params[:id])
  end

  def painter_scope
    policy_scope(Api::PaintersPolicy, Painter)
  end

  def set_painter_associations
    ActiveRecord::Associations::Preloader.new.preload(
      @painter, [
        artist: Artist.translations_associations
      ]
    )
  end
end
