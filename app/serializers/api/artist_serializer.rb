class Api::ArtistSerializer < Api::ApplicationSerializer
  serialize_association :user, with: Api::UserSerializer

  def attributes
    {
      id: model.id,
      name: model.name,
      user: user,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
