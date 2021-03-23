class Api::PageSerializer < Api::ApplicationSerializer
  serialize_associations :view, with: Api::ViewSerializer

  def attributes
    {
      id: model.id,
      chapter_id: model.chapter_id,
      number: model.number,
      views_count: model.views_count,
      bookmarks_count: model.bookmarks_count,
      file: file,
      view: view,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end

  private

  def file
    return nil if model.file.blank?

    {
      url: model.file.url,
      filename: model.file.filename,
      content_type: model.file.content_type,
      width: model.file.metadata[:width],
      height: model.file.metadata[:height],
      byte_size: model.file.byte_size,
      created_at: model.file.created_at
    }
  end
end
