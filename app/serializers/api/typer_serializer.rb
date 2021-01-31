class Api::TyperSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      user_id: model.artist.user_id,
      artist_id: model.artist_id,
      name: model.artist.name,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
