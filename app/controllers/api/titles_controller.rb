class Api::TitlesController < Api::ApplicationController
  include Pagination

  before_action :set_title, only: [:show, :update, :destroy]

  before_action -> { authorize(Api::TitlesPolicy) }, only: [:index, :create]
  before_action -> { authorize(Api::TitlesPolicy, title: @title) }, only: [:show, :update, :destroy]

  skip_after_action :verify_policy_scoped, only: [:create]

  def index
    titles = titles_scope.joins(:translations).order("title_translations.title ASC").all
    titles = paginate_countless(titles)

    ActiveRecord::Associations::Preloader.new.preload(
      titles, [
        Title.translations_associations,
        cover_attachment: :blob,
        resource_artists: { artist: Artist.translations_associations },
        genres: { tag: Tag.translations_associations },
        formats: { tag: Tag.translations_associations },
        demographics: { tag: Tag.translations_associations },
        marks: { tag: Tag.translations_associations },
        themes: { tag: Tag.translations_associations }
      ]
    )

    titles = Api::TitleDecorator.decorate(titles)
    titles = Api::TitleSerializer.serialize(titles)

    render json: titles, status: 200
  end

  def show
    ActiveRecord::Associations::Preloader.new.preload(
      @title, [
        Title.translations_associations,
        cover_attachment: :blob,
        resource_artists: { artist: Artist.translations_associations },
        genres: { tag: Tag.translations_associations },
        formats: { tag: Tag.translations_associations },
        demographics: { tag: Tag.translations_associations },
        marks: { tag: Tag.translations_associations },
        themes: { tag: Tag.translations_associations }
      ]
    )

    title = Api::TitleDecorator.decorate(@title)
    title = Api::TitleSerializer.serialize(title)

    render json: title, status: 200
  end

  def create
    service = Api::CreateTitle.new(create_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.title_object, [
          Title.translations_associations,
          cover_attachment: :blob,
          resource_artists: { artist: Artist.translations_associations },
          genres: { tag: Tag.translations_associations },
          formats: { tag: Tag.translations_associations },
          demographics: { tag: Tag.translations_associations },
          marks: { tag: Tag.translations_associations },
          themes: { tag: Tag.translations_associations }
        ]
      )

      title = Api::TitleDecorator.decorate(service.title_object)
      title = Api::TitleSerializer.serialize(title)

      render json: title, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def update
    service = Api::UpdateTitle.new(update_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.title_object, [
        Title.translations_associations,
          cover_attachment: :blob,
          resource_artists: { artist: Artist.translations_associations },
          genres: { tag: Tag.translations_associations },
          formats: { tag: Tag.translations_associations },
          demographics: { tag: Tag.translations_associations },
          marks: { tag: Tag.translations_associations },
          themes: { tag: Tag.translations_associations }
        ]
      )

      title = Api::TitleDecorator.decorate(service.title_object)
      title = Api::TitleSerializer.serialize(title)

      render json: title, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def destroy
    service = Api::DeleteTitle.new(title: @title)

    if service.call
      head 204
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

  def update_params
    permitted_attributes(Api::TitlesPolicy, :update).merge(title_object: @title)
  end

  def titles_scope
    policy_scope(Api::TitlesPolicy, Title)
  end
end
