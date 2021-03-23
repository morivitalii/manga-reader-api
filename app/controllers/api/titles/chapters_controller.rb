class Api::Titles::ChaptersController < Api::ApplicationController
  before_action :set_title, only: [:index, :show, :create]
  before_action :set_chapter, only: [:show]
  before_action :set_chapter_associations, only: [:show]

  before_action -> { authorize(Api::Titles::ChaptersPolicy) }, only: [:index, :create]
  before_action -> { authorize(Api::Titles::ChaptersPolicy, @chapter) }, only: [:show]

  def index
    chapters = chapters_scope.order("chapters.number ASC").all

    ActiveRecord::Associations::Preloader.new.preload(
      chapters, [
        :content_language,
        :volume,
        :group,
        :user,
        cover_attachment: :blob
      ]
    )

    chapters = Api::ChapterDecorator.decorate(chapters)
    chapters = Api::ChapterSerializer.serialize(chapters)

    render json: chapters, status: 200
  end

  def show
    chapter = Api::ChapterDecorator.decorate(@chapter)
    chapter = Api::ChapterSerializer.serialize(chapter)

    render json: chapter, status: 200
  end

  def create
    service = Api::Titles::CreateChapter.new(create_params)

    if service.call
      chapter = Api::ChapterDecorator.decorate(service.chapter)
      chapter = Api::ChapterSerializer.serialize(chapter)

      render json: chapter, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_title
    @title = titles_scope.find(params[:title_id])
  end

  def set_chapter
    @chapter = chapters_scope.find(params[:id])
  end

  def create_params
    permitted_attributes(Api::Titles::ChaptersPolicy, :create).merge(title: @title, user: Current.user)
  end

  def set_chapter_associations
    ActiveRecord::Associations::Preloader.new.preload(
      @chapter, [
        :content_language,
        :volume,
        :group,
        :user,
        cover_attachment: :blob
      ]
    )
  end

  def titles_scope
    policy_scope(Api::TitlesPolicy, Title)
  end

  def chapters_scope
    policy_scope(Api::Titles::ChaptersPolicy, @title.chapters)
  end
end
