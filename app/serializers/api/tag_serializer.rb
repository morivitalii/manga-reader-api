class Api::TagSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      title: model.title,
      key: model.key,
      description: model.description,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
