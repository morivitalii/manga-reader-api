class Api::GroupFavoriteSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      user_id: model.user_id,
      group_id: model.group_id,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
