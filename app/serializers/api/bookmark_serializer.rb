class Api::BookmarkSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      user_id: model.user_id,
      resource_type: model.resource_type,
      resource_id: model.resource_id
    }
  end
end
