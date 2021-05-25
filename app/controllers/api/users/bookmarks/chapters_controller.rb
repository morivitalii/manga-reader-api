class Api::Users::Bookmarks::ChaptersController < Api::ApplicationController
  include Pagination

  before_action -> { authorize(Api::Users::Bookmarks::ChaptersPolicy) }, only: [:index]
  before_action :set_user, only: [:index]

  def index
    chapters = chapters_scope.joins(:bookmarks).where(bookmarks: {user: @user}).order("bookmarks.updated_at DESC")
    chapters = paginate_countless(chapters)

    ActiveRecord::Associations::Preloader.new.preload(
      chapters, [
        :content_language,
        :volume,
        :group,
        cover_attachment: :blob
      ]
    )

    chapters = Api::ChapterDecorator.decorate(chapters)
    chapters = Api::ChapterSerializer.serialize(chapters)

    render json: chapters, status: 200
  end

  private

  def set_user
    @user = Current.user
  end

  def chapters_scope
    policy_scope(Api::Users::Bookmarks::ChaptersPolicy, Chapter)
  end
end
