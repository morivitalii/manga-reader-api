class Api::CoverSerializer < Api::ApplicationSerializer
  serialize_association :content_language, with: Api::ContentLanguageSerializer

  def attributes
    {
      id: model.id,
      content_language_id: model.content_language_id,
      created_at: model.created_at,
      updated_at: model.updated_at
    }
  end
end
