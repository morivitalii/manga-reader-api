class Api::Titles::ChaptersController < Api::ApplicationController
  before_action :set_group, only: [:create]
  before_action :set_title, only: [:index, :show, :create, :update]
  before_action :set_chapter, only: [:show, :update]

  before_action -> { authorize(Api::Titles::ChaptersPolicy) }, only: [:index]
  before_action -> { authorize(Api::Titles::ChaptersPolicy, group: @group) }, only: [:create]
  before_action -> { authorize(Api::Titles::ChaptersPolicy, chapter: @chapter) }, only: [:show]
  before_action -> { authorize(Api::Titles::ChaptersPolicy, group: @chapter.group, chapter: @chapter) }, only: [:update]

  def index
    chapters = chapters_scope.order("chapters.number ASC").all

    ActiveRecord::Associations::Preloader.new.preload(
      chapters, [
        :content_language,
        :volume,
        :group,
        cover_attachment: :blob,
        user: {
          user_setting: {
            avatar_attachment: :blob
          }
        }
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
        :volume,
        :group,
        cover_attachment: :blob,
        user: {
          user_setting: {
            avatar_attachment: :blob
          }
        }
      ]
    )

    chapter = Api::ChapterDecorator.decorate(@chapter)
    chapter = Api::ChapterSerializer.serialize(chapter)

    render json: chapter, status: 200
  end

  def create
    service = Api::Titles::CreateChapter.new(create_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.chapter, [
          :content_language,
          :volume,
          :group,
          cover_attachment: :blob,
          user: {
            user_setting: {
              avatar_attachment: :blob
            }
          }
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
    service = Api::Titles::UpdateChapter.new(update_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.chapter, [
          :content_language,
          :volume,
          :group,
          cover_attachment: :blob,
          user: {
            user_setting: {
              avatar_attachment: :blob
            }
          }
        ]
      )

      chapter = Api::ChapterDecorator.decorate(service.chapter)
      chapter = Api::ChapterSerializer.serialize(chapter)

      render json: chapter, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_group
    @group = params[:group_id].present? ? Group.where(id: params[:group_id]).take : nil
  end

  def set_title
    @title = titles_scope.find(params[:title_id])
  end

  def set_chapter
    @chapter = chapters_scope.find(params[:id])
  end

  def create_params
    permitted_attributes(Api::Titles::ChaptersPolicy, :create).merge(title: @title, user: Current.user)
  end

  def update_params
    permitted_attributes(Api::Titles::ChaptersPolicy, :update).merge(chapter: @chapter)
  end

  def titles_scope
    policy_scope(Api::TitlesPolicy, Title)
  end

  def chapters_scope
    policy_scope(Api::Titles::ChaptersPolicy, @title.chapters)
  end
end
