class Api::BookmarkSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      user_id: model.user_id,
      resource_name: model.resource_name,
      resource_id: model.resource_id,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
