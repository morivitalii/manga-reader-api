class Api::Titles::Chapters::ViewsController < Api::ApplicationController
  before_action :set_title, only: [:create]
  before_action :set_chapter, only: [:create]
  before_action -> { authorize(Api::Titles::Chapters::ViewsPolicy) }, only: [:create]

  def create
    Api::Titles::Chapters::CreateViewWorker.perform_async(@chapter.id, current_user.id)

    head 204
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
