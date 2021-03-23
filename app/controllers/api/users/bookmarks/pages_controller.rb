class Api::Users::Bookmarks::PagesController < Api::ApplicationController
  include Pagination

  before_action -> { authorize(Api::Users::Bookmarks::PagesPolicy) }, only: [:index]
  before_action :set_user, only: [:index]

  def index
    pages = pages_scope.joins(:bookmarks).where(bookmarks: {user: @user}).order("bookmarks.updated_at DESC")
    pagination, pages = paginate_countless(pages)

    set_pagination_headers(pagination)

    ActiveRecord::Associations::Preloader.new.preload(
      pages, [
        file_attachment: :blob
      ]
    )

    pages = Api::PageDecorator.decorate(pages)
    pages = Api::PageSerializer.serialize(pages)

    render json: pages, status: 200
  end

  private

  def set_user
    @user = Current.user
  end

  def pages_scope
    policy_scope(Api::Users::Bookmarks::PagesPolicy, Page)
  end
end
