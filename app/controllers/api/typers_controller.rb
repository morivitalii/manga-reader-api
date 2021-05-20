class Api::TypersController < Api::ApplicationController
  include Pagination

  before_action :set_typer, only: [:show]

  before_action -> { authorize(Api::TypersPolicy) }, only: [:index]
  before_action -> { authorize(Api::TypersPolicy, typer: @typer) }, only: [:show]

  def index
    typers = typer_scope.order(id: :asc)
    typers = paginate_countless(typers)

    ActiveRecord::Associations::Preloader.new.preload(
      typers, [
        artist: Artist.translations_associations
      ]
    )

    typers = Api::TyperDecorator.decorate(typers)
    typers = Api::TyperSerializer.serialize(typers)

    render json: typers, status: 200
  end

  def show
    cache_key = endpoint_cache_key(@typer)

    typer = Rails.cache.fetch(cache_key) do
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
