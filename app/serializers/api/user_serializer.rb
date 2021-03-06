class Api::UserSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      username: model.username,
      favorites_count: model.favorites_count,
      bookmarks_count: model.bookmarks_count,
      views_count: model.views_count,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
