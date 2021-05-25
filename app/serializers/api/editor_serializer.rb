class Api::EditorSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      user_id: model.artist.user_id,
      artist_id: model.artist_id,
      name: model.artist.name
    }
  end
end
