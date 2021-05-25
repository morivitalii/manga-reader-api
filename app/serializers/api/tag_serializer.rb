class Api::TagSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      title: model.title,
      key: model.key,
      description: model.description
    }
  end
end
