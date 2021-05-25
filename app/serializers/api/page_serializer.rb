class Api::PageSerializer < Api::ApplicationSerializer
  def attributes
    {
      id: model.id,
      chapter_id: model.chapter_id,
      user_id: model.user_id,
      number: model.number,
      created_at: model.created_at,
      file: file
    }
  end

  private

  def file
    return nil if model.file.blank?

    {
      url: model.file.url,
      content_type: model.file.content_type,
      width: model.file.metadata[:width],
      height: model.file.metadata[:height]
    }
  end
end
