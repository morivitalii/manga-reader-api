class Api::TitlesController < Api::ApplicationController
  include Pagination

  before_action :set_title, only: [:show]
  before_action :set_title_associations, only: [:show]

  before_action -> { authorize(Api::TitlesPolicy) }, only: [:index]
  before_action -> { authorize(Api::TitlesPolicy, @title) }, only: [:show]

  def index
    titles = Title.joins(:translations).order("title_translations.title ASC").all
    pagination, titles = paginate_countless(titles)

    ActiveRecord::Associations::Preloader.new.preload(
      titles, [
        Title.translations_associations,
        :genres,
        :formats,
        :demographics,
        :marks,
        :themes,
        tags: Tag.translations_associations
      ]
    )

    titles = Api::TitleDecorator.decorate(titles)
    titles = Api::TitleSerializer.serialize(titles)

    set_pagination_headers(pagination)

    render json: titles, status: 200
  end

  def show
    title = Api::TitleDecorator.decorate(@title)
    title = Api::TitleSerializer.serialize(title)

    render json: title, status: 200
  end

  private

  def set_title
    @title = Title.find(params[:id])
  end

  def set_title_associations
    ActiveRecord::Associations::Preloader.new.preload(
      @title, [
        Title.translations_associations,
        :genres,
        :formats,
        :demographics,
        :marks,
        :themes,
        tags: Tag.translations_associations
      ]
    )
  end
end
