class Api::FavoriteSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
