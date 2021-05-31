class Api::GroupSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      title: model.title,
      created_at: model.created_at
    }
  end
end
