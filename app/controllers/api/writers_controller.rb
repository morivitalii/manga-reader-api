class Api::WritersController < Api::ApplicationController
  include Pagination

  before_action :set_writer, only: [:show]

  before_action -> { authorize(Api::WritersPolicy, writer: @writer) }, only: [:show]

  def show
    cache_key = endpoint_cache_key(@writer)

    # Any change in this code block must be accompanied by thinking
    # about the cache invalidation with model associations
    writer = Rails.cache.fetch(cache_key, expires_in: 24.hours) do
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
