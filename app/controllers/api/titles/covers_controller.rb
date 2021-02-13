class Api::Titles::CoversController < Api::ApplicationController
  include Pagination

  before_action :set_title, only: [:index, :show]
  before_action :set_cover, only: [:show]

  before_action -> { authorize(Api::Titles::CoversPolicy) }, only: [:index]
  before_action -> { authorize(Api::Titles::CoversPolicy, @cover) }, only: [:show]

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
end
