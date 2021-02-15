class Api::WritersController < Api::ApplicationController
  include Pagination

  before_action :set_writer, only: [:show]
  before_action :set_writer_associations, only: [:show]

  before_action -> { authorize(Api::WritersPolicy) }, only: [:index]
  before_action -> { authorize(Api::WritersPolicy, @writer) }, only: [:show]

  def index
    writers = writer_scope.order(id: :asc)
    pagination, writers = paginate_countless(writers)

    set_pagination_headers(pagination)

    ActiveRecord::Associations::Preloader.new.preload(
      writers, [
        artist: Artist.translations_associations
      ]
    )

    writers = Api::WriterDecorator.decorate(writers)
    writers = Api::WriterSerializer.serialize(writers)

    render json: writers, status: 200
  end

  def show
    writer = Api::WriterDecorator.decorate(@writer)
    writer = Api::WriterSerializer.serialize(writer)

    render json: writer, status: 200
  end

  private

  def set_writer
    @writer = writer_scope.find(params[:id])
  end

  def writer_scope
    policy_scope(Api::WritersPolicy, Writer)
  end

  def set_writer_associations
    ActiveRecord::Associations::Preloader.new.preload(
      @writer, [
        artist: Artist.translations_associations
      ]
    )
  end
end
