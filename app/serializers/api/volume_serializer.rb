class Api::VolumeSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      title_id: model.title_id,
      number: model.number
    }
  end
end
