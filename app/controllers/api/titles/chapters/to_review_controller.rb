class Api::Titles::Chapters::ToReviewController < Api::ApplicationController
  before_action :set_title, only: [:update]
  before_action :set_chapter, only: [:update]

  before_action -> { authorize(Api::Titles::Chapters::ToReviewPolicy, @chapter) }, only: [:update]

  def update
    service = Api::Titles::Chapters::ToReview.new(chapter: @chapter)

    if service.call
      head 204
    else
      head 422
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
