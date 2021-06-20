class Api::Books::Chapters::ToReviewController < Api::ApplicationController
  before_action :set_book, only: [:update]
  before_action :set_chapter, only: [:update]

  before_action -> { authorize(Api::Books::Chapters::ToReviewPolicy, chapter: @chapter) }, only: [:update]

  def update
    service = Api::Books::Chapters::ToReview.new(chapter: @chapter)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        @chapter, [
          :content_language,
          :volume,
          :group,
          cover_attachment: :blob,
          resource_artists: { artist: Artist.translations_associations },
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
end
