class Api::ArtistSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      user_id: model.user_id,
      name: model.name,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
