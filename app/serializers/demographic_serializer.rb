class DemographicSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      tag_id: model.tag_id,
      title: model.tag.title,
      created_at: model.created_at,
      updated_at: model.updated_at,
      translations: tag.attributes[:translations],
    }
  end

  private

  def tag
    return nil unless model.association(:tag).loaded?
    return nil if model.tag.blank?

    Api::TagSerializer.serialize(model.tag)
  end
end
