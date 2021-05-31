class Api::ThemeSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      tag_id: model.tag_id,
      title: model.tag.title,
      description: model.tag.description
    }
  end
end
