class Api::BookmarksController < Api::ApplicationController
  include Pagination

  before_action :set_user, only: [:index]

  before_action -> { authorize(Api::BookmarksPolicy, user: @user) }, only: [:index]

  def index
    scope = bookmarks_scope.order(updated_at: :desc)
    service = Api::FilterBookmarks.new(scope: scope, params: index_params)

    if service.call
      bookmarks = service.bookmarks

      # Apply pagination if filtering is not by ids
      unless index_params.resource_type_and_ids_context?
        bookmarks = paginate_countless(bookmarks)
      end

      bookmarks = Api::BookmarkDecorator.decorate(bookmarks)
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

  def bookmarks_scope
    policy_scope(Api::BookmarksPolicy, @user.bookmarks)
  end

  def index_params
    permitted_attributes = permitted_attributes(Api::BookmarksPolicy, :index)

    Api::Bookmarks::IndexParams.new(permitted_attributes)
  end
end
