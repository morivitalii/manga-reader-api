class Api::TypersController < Api::ApplicationController
  include Pagination

  before_action :set_typer, only: [:show]
  before_action :set_typer_associations, only: [:show]

  before_action -> { authorize(Api::TypersPolicy) }, only: [:index]
  before_action -> { authorize(Api::TypersPolicy, @typer) }, only: [:show]

  def index
    typers = typer_scope.order(id: :asc)
    pagination, typers = paginate_countless(typers)

    set_pagination_headers(pagination)

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
    typer = Api::TyperDecorator.decorate(@typer)
    typer = Api::TyperSerializer.serialize(typer)

    render json: typer, status: 200
  end

  private

  def set_typer
    @typer = typer_scope.find(params[:id])
  end

  def typer_scope
    policy_scope(Api::TypersPolicy, Typer)
  end

  def set_typer_associations
    ActiveRecord::Associations::Preloader.new.preload(
        @typer, [
        artist: Artist.translations_associations
      ]
    )
  end
end
