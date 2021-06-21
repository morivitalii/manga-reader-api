class Api::Books::ChaptersController < Api::ApplicationController
  before_action :set_group, only: [:create]
  before_action :set_book, only: [:index, :show, :create, :update, :destroy]
  before_action :set_chapter, only: [:show, :update, :destroy]

  before_action -> { authorize(Api::Books::ChaptersPolicy) }, only: [:index]
  before_action -> { authorize(Api::Books::ChaptersPolicy, group: @group) }, only: [:create]
  before_action -> { authorize(Api::Books::ChaptersPolicy, chapter: @chapter) }, only: [:show]
  before_action -> { authorize(Api::Books::ChaptersPolicy, group: @chapter.group, chapter: @chapter) }, only: [:update, :destroy]

  def index
    chapters = chapters_scope.order("chapters.number ASC").all

    ActiveRecord::Associations::Preloader.new.preload(
      chapters, [
        :content_language,
        :group,
        cover_attachment: :blob,
        resource_artists: { artist: Artist.translations_associations },
      ]
    )

    chapters = Api::ChapterDecorator.decorate(chapters)
    chapters = Api::ChapterSerializer.serialize(chapters)

    render json: chapters, status: 200
  end

  def show
    ActiveRecord::Associations::Preloader.new.preload(
      @chapter, [
        :content_language,
        :group,
        cover_attachment: :blob,
        resource_artists: { artist: Artist.translations_associations },
      ]
    )

    chapter = Api::ChapterDecorator.decorate(@chapter)
    chapter = Api::ChapterSerializer.serialize(chapter)

    render json: chapter, status: 200
  end

  def create
    service = Api::Books::CreateChapter.new(create_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.chapter, [
          :content_language,
          :group,
          cover_attachment: :blob,
          resource_artists: { artist: Artist.translations_associations },
        ]
      )

      chapter = Api::ChapterDecorator.decorate(service.chapter)
      chapter = Api::ChapterSerializer.serialize(chapter)

      render json: chapter, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def update
    service = Api::Books::UpdateChapter.new(update_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.chapter, [
          :content_language,
          :group,
          cover_attachment: :blob,
          resource_artists: { artist: Artist.translations_associations },
        ]
      )

      chapter = Api::ChapterDecorator.decorate(service.chapter)
      chapter = Api::ChapterSerializer.serialize(chapter)

      render json: chapter, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def destroy
    service = Api::Books::DeleteChapter.new(chapter: @chapter)

    if service.call
      head 204
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_group
    @group = params[:group_id].present? ? Group.where(id: params[:group_id]).take : nil
  end

  def set_book
    @book = books_scope.find(params[:book_id])
  end

  def set_chapter
    @chapter = chapters_scope.find(params[:id])
  end

  def create_params
    permitted_attributes = permitted_attributes(Api::Books::ChaptersPolicy, :create)
    params = Api::Books::Chapters::CreateParams.new(permitted_attributes)

    permitted_attributes.merge(
      book: @book,
      user: Current.user,
      cleaner_ids: params.cleaner_ids,
      translator_ids: params.translator_ids,
      editor_ids: params.editor_ids,
      typer_ids: params.typer_ids
    )
  end

  def update_params
    permitted_attributes = permitted_attributes(Api::Books::ChaptersPolicy, :update)
    params = Api::Books::Chapters::UpdateParams.new(permitted_attributes)

    permitted_attributes.merge(
      chapter: @chapter,
      cleaner_ids: params.cleaner_ids,
      translator_ids: params.translator_ids,
      editor_ids: params.editor_ids,
      typer_ids: params.typer_ids
    )
  end

  def books_scope
    policy_scope(Api::BooksPolicy, Book)
  end

  def chapters_scope
    policy_scope(Api::Books::ChaptersPolicy, @book.chapters)
  end
end
