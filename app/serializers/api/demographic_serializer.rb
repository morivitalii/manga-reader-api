class Api::DemographicSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      tag_id: model.tag_id,
      title: model.tag.title,
      key: model.tag.key,
      description: model.tag.description
    }
  end
end
