class Api::GroupSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      title: model.title,
      users_count: model.users_count,
      favorites_count: model.favorites_count,
      created_at: model.created_at
    }
  end
end
