class Api::Users::Views::PagesController < Api::ApplicationController
  include Pagination

  before_action -> { authorize(Api::Users::Views::PagesPolicy) }, only: [:index]
  before_action :set_user, only: [:index]

  def index
    pages = pages_scope.joins(:views).where(views: {user: @user}).order("views.updated_at DESC")
    pages = paginate_countless(pages)

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
    policy_scope(Api::Users::Views::PagesPolicy, Page)
  end
end
