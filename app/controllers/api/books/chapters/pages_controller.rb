class Api::Books::Chapters::PagesController < Api::ApplicationController
  before_action :set_book, only: [:index, :show, :create]
  before_action :set_chapter, only: [:index, :show, :create]
  before_action :set_group, only: [:create]
  before_action :set_page, only: [:show]

  before_action -> { authorize(Api::Books::Chapters::PagesPolicy) }, only: [:index]
  before_action -> { authorize(Api::Books::Chapters::PagesPolicy, group: @group) }, only: [:create]
  before_action -> { authorize(Api::Books::Chapters::PagesPolicy, page: @page) }, only: [:show]

  def index
    pages = pages_scope.order("pages.number ASC").all

    ActiveRecord::Associations::Preloader.new.preload(
      pages, [
        file_attachment: :blob
      ]
    )

    pages = Api::PageDecorator.decorate(pages)
    pages = Api::PageSerializer.serialize(pages)

    render json: pages, status: 200
  end

  def show
    cache_key = endpoint_cache_key(@page)

    # Any change in this code block must be accompanied by thinking
    # about the cache invalidation with model associations
    page = Rails.cache.fetch(cache_key, expires_in: 24.hours) do
      ActiveRecord::Associations::Preloader.new.preload(
        @page, [
          file_attachment: :blob
        ]
      )

      page = Api::PageDecorator.decorate(@page)

      Api::PageSerializer.serialize(page).to_json
    end

    render json: page, status: 200
  end

  def create
    service = Api::Books::Chapters::CreatePage.new(create_params)

    if service.call
      ActiveRecord::Associations::Preloader.new.preload(
        service.page, [
          file_attachment: :blob
        ]
      )

      page = Api::PageDecorator.decorate(service.page)
      page = Api::PageSerializer.serialize(page)

      render json: page, status: 200
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

  def set_page
    @page = pages_scope.find(params[:id])
  end

  def set_group
    @group = @chapter.group
  end

  def create_params
    permitted_attributes(Api::Books::Chapters::PagesPolicy, :create).merge(chapter: @chapter, user: Current.user)
  end

  def books_scope
    policy_scope(Api::BooksPolicy, Book)
  end

  def chapters_scope
    policy_scope(Api::Books::ChaptersPolicy, @book.chapters)
  end

  def pages_scope
    policy_scope(Api::Books::Chapters::PagesPolicy, @chapter.pages)
  end
end
