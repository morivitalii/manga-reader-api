class Api::Users::Views::ChaptersController < Api::ApplicationController
  include Pagination

  before_action -> { authorize(Api::Users::Views::ChaptersPolicy) }, only: [:index]
  before_action :set_user, only: [:index]

  def index
    chapters = chapters_scope.joins(:views).where(views: {user: @user}).order("views.updated_at DESC")
    chapters = paginate_countless(chapters)

    ActiveRecord::Associations::Preloader.new.preload(
      chapters, [
        :content_language,
        :volume,
        :group,
        :user,
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
    policy_scope(Api::Users::Views::ChaptersPolicy, Chapter)
  end
end
