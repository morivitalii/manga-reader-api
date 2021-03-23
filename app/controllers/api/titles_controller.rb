class Api::TitlesController < Api::ApplicationController
  include Pagination

  before_action :set_title, only: [:show]
  before_action :set_title_associations, only: [:show]

  before_action -> { authorize(Api::TitlesPolicy) }, only: [:index, :create]
  before_action -> { authorize(Api::TitlesPolicy, @title) }, only: [:show]

  skip_after_action :verify_policy_scoped, only: [:create]

  def index
    titles = titles_scope.joins(:translations).order("title_translations.title ASC").all
    pagination, titles = paginate_countless(titles)

    set_pagination_headers(pagination)

    ActiveRecord::Associations::Preloader.new.preload(
      titles, [
        Title.translations_associations,
        original_content_language: [
          :locale,
          ContentLanguage.translations_associations
        ],
        cover_attachment: :blob,
        writers: { artist: Artist.translations_associations },
        painters: { artist: Artist.translations_associations },
        genres: { tag: Tag.translations_associations },
        formats: { tag: Tag.translations_associations },
        demographics: { tag: Tag.translations_associations },
        marks: { tag: Tag.translations_associations },
        themes: { tag: Tag.translations_associations }
      ]
    )

    if Current.user.present?
      ActiveRecord::Associations::Preloader.new.preload(
        titles, [
          :favorite,
          :view
        ]
      )
    end

    titles = Api::TitleDecorator.decorate(titles)
    titles = Api::TitleSerializer.serialize(titles)

    render json: titles, status: 200
  end

  def show
    title = Api::TitleDecorator.decorate(@title)
    title = Api::TitleSerializer.serialize(title)

    render json: title, status: 200
  end

  def create
    service = Api::CreateTitle.new(create_params)

    if service.call
      title = Api::TitleDecorator.decorate(service.title_object)
      title = Api::TitleSerializer.serialize(title)

      render json: title, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_title
    @title = titles_scope.find(params[:id])
  end

  def create_params
    permitted_attributes(Api::TitlesPolicy, :create)
  end

  def titles_scope
    policy_scope(Api::TitlesPolicy, Title)
  end

  def set_title_associations
    ActiveRecord::Associations::Preloader.new.preload(
      @title, [
        Title.translations_associations,
        original_content_language: [
          :locale,
          ContentLanguage.translations_associations
        ],
        cover_attachment: :blob,
        writers: { artist: Artist.translations_associations },
        painters: { artist: Artist.translations_associations },
        genres: { tag: Tag.translations_associations },
        formats: { tag: Tag.translations_associations },
        demographics: { tag: Tag.translations_associations },
        marks: { tag: Tag.translations_associations },
        themes: { tag: Tag.translations_associations }
      ]
    )

    if Current.user.present?
      ActiveRecord::Associations::Preloader.new.preload(
        @title, [
          :favorite,
          :view
        ]
      )
    end
  end
end
