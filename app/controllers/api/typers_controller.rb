class Api::TypersController < Api::ApplicationController
  include Pagination

  before_action :set_typer, only: [:show]

  before_action -> { authorize(Api::TypersPolicy, typer: @typer) }, only: [:show]

  def show
    cache_key = endpoint_cache_key(@typer)

    # Any change in this code block must be accompanied by thinking
    # about the cache invalidation with model associations
    typer = Rails.cache.fetch(cache_key, expires_in: 24.hours) do
      ActiveRecord::Associations::Preloader.new.preload(
        @typer, [
          artist: Artist.translations_associations
        ]
      )

      typer = Api::TyperDecorator.decorate(@typer)

      Api::TyperSerializer.serialize(typer).to_json
    end

    render json: typer, status: 200
  end

  private

  def set_typer
    @typer = typer_scope.find(params[:id])
  end

  def typer_scope
    policy_scope(Api::TypersPolicy, Typer)
  end
end
