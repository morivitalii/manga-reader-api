class Api::Books::Chapters::CoverController < Api::ApplicationController
  before_action :set_book, only: [:update, :destroy]
  before_action :set_chapter, only: [:update, :destroy]

  before_action -> { authorize(Api::Books::Chapters::CoverPolicy, book: @book) }, only: [:update, :destroy]

  def update
    service = Api::Books::Chapters::UpdateCover.new(update_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.chapter, [
          :content_language,
          :volume,
          :group,
          cover_attachment: :blob
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
    service = Api::Books::Chapters::DeleteCover.new(chapter: @chapter)

    if service.call
      head 204
    else
      render json: service.errors, status: 422
    end
  end

  private

  def set_book
    @book = books_scope.find(params[:book_id])
  end

  def set_chapter
    @chapter = chapters_scope.find(params[:chapter_id])
  end

  def books_scope
    policy_scope(Api::BooksPolicy, Book)
  end

  def chapters_scope
    policy_scope(Api::Books::ChaptersPolicy, @book.chapters)
  end

  def update_params
    permitted_attributes(Api::Books::Chapters::CoverPolicy, :update).merge(chapter: @chapter)
  end
end
