class Api::Users::Titles::BookmarksController < Api::ApplicationController
  before_action -> { authorize(Api::Users::Titles::BookmarksPolicy) }, only: [:index]
  before_action :set_user, only: [:index]

  def index
    service = Api::Users::Titles::FilterBookmarks.new(filter_params)

    if service.call
      bookmarks = Api::TitleBookmarkDecorator.decorate(service.bookmarks)
      bookmarks = Api::TitleBookmarkSerializer.serialize(bookmarks)

      render json: bookmarks, status: 200
    else
      head 422
    end
  end

  private

  def set_user
    @user = Current.user
  end

  def filter_params
    permitted_attributes(Api::Users::Titles::BookmarksPolicy, :index).merge(scope: bookmarks_scope)
  end

  def bookmarks_scope
    scope = @user.bookmarks.where(resource_type: "Title")

    policy_scope(Api::Users::Titles::BookmarksPolicy, scope)
  end
end
