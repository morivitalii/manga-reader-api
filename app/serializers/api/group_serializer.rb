class Api::GroupSerializer < Api::ApplicationSerializer
  serialize_associations :favorite, with: Api::FavoriteSerializer

  def attributes
    {
      id: model.id,
      title: model.title,
      favorites_count: model.favorites_count,
      favorite: favorite,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
