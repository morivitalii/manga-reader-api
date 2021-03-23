class Api::GroupSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      title: model.title,
      favorites_count: model.favorites_count,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
