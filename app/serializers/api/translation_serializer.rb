# This class is intended to unify translatable model translations serialization
class Api::TranslationSerializer < Api::ApplicationSerializer
  serialize_associations :translation_available_content_languages, with: Api::ContentLanguageSerializer
  serialize_associations :translation_completed_content_languages, with: Api::ContentLanguageSerializer
  serialize_associations :translation_content_languages_in_progress, with: Api::ContentLanguageSerializer
  serialize_associations :translation_absent_content_languages, with: Api::ContentLanguageSerializer

  def attributes
    {
      id: model.id,
      attributes_names: model.translation_attributes_names,
      attributes: model.translation_attributes,
      content_languages: {
        available: translation_available_content_languages,
        completed: translation_completed_content_languages,
        progress: translation_content_languages_in_progress,
        absent: translation_absent_content_languages
      }
    }
  end
end
