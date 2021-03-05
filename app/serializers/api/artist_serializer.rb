class Api::ArtistSerializer < Api::ApplicationSerializer
  serialize_associations :favorite, with: Api::FavoriteSerializer

  def attributes
    {
      id: model.id,
      user_id: model.user_id,
      name: model.name,
      favorites_count: model.favorites_count,
      favorite: favorite,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
