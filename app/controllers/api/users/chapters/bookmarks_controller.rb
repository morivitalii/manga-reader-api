class Api::Users::Chapters::BookmarksController < Api::ApplicationController
  before_action -> { authorize(Api::Users::Chapters::BookmarksPolicy) }, only: [:index]
  before_action :set_user, only: [:index]

  def index
    service = Api::Users::Chapters::FilterBookmarks.new(filter_params)

    if service.call
      bookmarks = Api::BookmarkDecorator.decorate(service.bookmarks)
      bookmarks = Api::BookmarkSerializer.serialize(bookmarks)

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
    permitted_attributes(Api::Users::Chapters::BookmarksPolicy, :index).merge(scope: bookmarks_scope)
  end

  def bookmarks_scope
    scope = @user.bookmarks.where(resource_type: "Chapter")

    policy_scope(Api::Users::Chapters::BookmarksPolicy, scope)
  end
end
