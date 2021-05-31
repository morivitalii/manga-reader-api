class Api::ChapterSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      content_language_id: model.content_language_id,
      title_id: model.title_id,
      group_id: model.group_id,
      name: model.name,
      number: model.number,
      status: model.status,
      pages_count: model.pages_count,
      cover: cover
    }
  end

  private

  def cover
    return nil if model.cover.blank?

    {
      url: model.cover.url,
      content_type: model.cover.content_type,
      width: model.cover.metadata[:width],
      height: model.cover.metadata[:height]
    }
  end
end
