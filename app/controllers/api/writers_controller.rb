class Api::WritersController < Api::ApplicationController
  include Pagination

  before_action :set_writer, only: [:show]

  before_action -> { authorize(Api::WritersPolicy) }, only: [:index]
  before_action -> { authorize(Api::WritersPolicy, writer: @writer) }, only: [:show]

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
    cache_key = cache_key(@writer)

    writer = Rails.cache.fetch(cache_key) do
      ActiveRecord::Associations::Preloader.new.preload(
        @writer, [
          artist: Artist.translations_associations
        ]
      )

      writer = Api::WriterDecorator.decorate(@writer)

      Api::WriterSerializer.serialize(writer).to_json
    end

    render json: writer, status: 200
  end

  private

  def set_writer
    @writer = writer_scope.find(params[:id])
  end

  def writer_scope
    policy_scope(Api::WritersPolicy, Writer)
  end
end
