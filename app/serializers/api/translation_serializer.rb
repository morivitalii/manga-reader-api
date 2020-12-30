# This class is intended to unify translatable model translations serialization
class Api::TranslationSerializer < Api::ApplicationSerializer
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

  private

  def translation_available_content_languages
    Api::ContentLanguageSerializer.serialize(
      model.translation_available_content_languages,
      except: [:created_at, :updated_at]
    )
  end

  def translation_completed_content_languages
    Api::ContentLanguageSerializer.serialize(
      model.translation_completed_content_languages,
      except: [:created_at, :updated_at]
    )
  end

  def translation_content_languages_in_progress
    Api::ContentLanguageSerializer.serialize(
      model.translation_content_languages_in_progress,
      except: [:created_at, :updated_at]
    )
  end

  def translation_absent_content_languages
    Api::ContentLanguageSerializer.serialize(
      model.translation_absent_content_languages,
      except: [:created_at, :updated_at]
    )
  end
end