
class Api::Titles::Chapters::ToDraftController < Api::ApplicationController
  before_action :set_title, only: [:update]
  before_action :set_chapter, only: [:update]

  before_action -> { authorize(Api::Titles::Chapters::ToDraftPolicy, chapter: @chapter) }, only: [:update]

  def update
    service = Api::Titles::Chapters::ToDraft.new(chapter: @chapter)

    if service.call
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
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_title
    @title = titles_scope.find(params[:title_id])
  end

  def set_chapter
    @chapter = chapters_scope.find(params[:chapter_id])
  end

  def titles_scope
    policy_scope(Api::TitlesPolicy, Title)
  end

  def chapters_scope
    policy_scope(Api::Titles::ChaptersPolicy, @title.chapters)
  end
end
