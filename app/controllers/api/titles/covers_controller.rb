class Api::Titles::CoversController < Api::ApplicationController
  include Pagination

  before_action :set_title, only: [:index, :show, :create, :destroy]
  before_action :set_cover, only: [:show, :destroy]

  before_action -> { authorize(Api::Titles::CoversPolicy) }, only: [:index, :create]
  before_action -> { authorize(Api::Titles::CoversPolicy, @cover) }, only: [:show, :destroy]

  def index
    covers = covers_scope.order("covers.id ASC").all
    pagination, covers = paginate_countless(covers)

    set_pagination_headers(pagination)

    covers = Api::CoverDecorator.decorate(covers)
    covers = Api::CoverSerializer.serialize(covers)

    render json: covers, status: 200
  end

  def show
    cover = Api::CoverDecorator.decorate(@cover)
    cover = Api::CoverSerializer.serialize(cover)

    render json: cover, status: 200
  end

  def create
    service = Api::Titles::CreateCover.new(create_params)

    if service.call
      cover = Api::CoverDecorator.decorate(service.cover)
      cover = Api::CoverSerializer.serialize(cover)

      render json: cover, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def destroy
    service = Api::Titles::DeleteCover.new(cover: @cover)

    if service.call
      head 204
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_title
    @title = titles_scope.find(params[:title_id])
  end

  def set_cover
    @cover = covers_scope.find(params[:id])
  end

  def titles_scope
    policy_scope(Api::TitlesPolicy, Title)
  end

  def covers_scope
    policy_scope(Api::Titles::CoversPolicy, @title.covers)
  end

  def create_params
    permitted_attributes(Api::Titles::CoversPolicy, :create).merge(title: @title)
  end
end
