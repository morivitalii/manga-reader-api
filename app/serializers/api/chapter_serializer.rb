class Api::ChapterSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      title_id: model.title_id,
      volume_id: model.volume_id,
      group_id: model.group_id,
      number: model.number,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
