class Api::VolumeSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      title_id: model.title_id,
      number: model.number,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
