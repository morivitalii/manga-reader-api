# This class is intended to unify translatable model translations serialization
class Api::TranslationSerializer < Api::ApplicationSerializer
  serialize_association :translation_available_content_languages,
    with: Api::ContentLanguageSerializer,
    except: [:created_at, :updated_at]

  serialize_association :translation_completed_content_languages,
    with: Api::ContentLanguageSerializer,
    except: [:created_at, :updated_at]

  serialize_association :translation_content_languages_in_progress,
    with: Api::ContentLanguageSerializer,
    except: [:created_at, :updated_at]

  serialize_association :translation_absent_content_languages,
    with: Api::ContentLanguageSerializer,
    except: [:created_at, :updated_at]

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