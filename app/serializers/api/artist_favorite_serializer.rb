class Api::ArtistFavoriteSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      user_id: model.user_id,
      artist_id: model.artist_id,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
