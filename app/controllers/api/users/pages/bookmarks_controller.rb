class Api::Users::Pages::BookmarksController < Api::ApplicationController
  before_action -> { authorize(Api::Users::Pages::BookmarksPolicy) }, only: [:index]
  before_action :set_user, only: [:index]

  def index
    service = Api::Users::Pages::FilterBookmarks.new(filter_params)

    if service.call
      bookmarks = Api::PageBookmarkDecorator.decorate(service.bookmarks)
      bookmarks = Api::PageBookmarkSerializer.serialize(bookmarks)

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
    permitted_attributes(Api::Users::Pages::BookmarksPolicy, :index).merge(scope: bookmarks_scope)
  end

  def bookmarks_scope
    scope = @user.bookmarks.where(resource_type: "Page")

    policy_scope(Api::Users::Pages::BookmarksPolicy, scope)
  end
end
