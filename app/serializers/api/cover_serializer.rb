class Api::CoverSerializer < Api::ApplicationSerializer
  serialize_association :content_language, with: Api::ContentLanguageSerializer

  def attributes
    {
      id: model.id,
      content_language_id: model.content_language_id,
      file: {
        url: model.file.url,
        filename: model.file.filename,
        content_type: model.file.content_type,
        width: model.file.metadata[:width],
        height: model.file.metadata[:height],
        byte_size: model.file.byte_size,
        created_at: model.file.created_at
      },
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
