class Api::Titles::Chapters::CoverController < Api::ApplicationController
  before_action :set_title, only: [:update, :destroy]
  before_action :set_chapter, only: [:update, :destroy]

  before_action -> { authorize(Api::Titles::Chapters::CoverPolicy, @title) }, only: [:update, :destroy]

  def update
    service = Api::Titles::Chapters::UpdateCover.new(update_params)

    if service.call
      cover = Api::PageDecorator.decorate(service.chapter.cover)
      cover = Api::PageSerializer.serialize(cover)

      render json: cover, status: 200
    else
      render json: service.errors, status: 422
    end
  end

  def destroy
    service = Api::Titles::Chapters::DeleteCover.new(chapter: @chapter)

    if service.call
      head(204)
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

  def update_params
    permitted_attributes(Api::Titles::Chapters::CoverPolicy, :update).merge(chapter: @chapter)
  end
end
