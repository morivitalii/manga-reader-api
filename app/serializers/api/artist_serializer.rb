class Api::ArtistSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      user_id: model.user_id,
      name: model.name,
      favorites_count: model.favorites_count
    }
  end
end
