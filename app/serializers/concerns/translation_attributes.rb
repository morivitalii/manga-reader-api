# This module is intended to simplify model attributes translations
module TranslationAttributes
  extend ActiveSupport::Concern

  private

  def translations
    {
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

  def translation_available_content_languages
    ContentLanguageSerializer.serialize(
      model.translation_available_content_languages,
      except: [:translations, :created_at, :updated_at]
    )
  end

  def translation_completed_content_languages
    ContentLanguageSerializer.serialize(
      model.translation_completed_content_languages,
      except: [:translations, :created_at, :updated_at]
    )
  end

  def translation_content_languages_in_progress
    ContentLanguageSerializer.serialize(
      model.translation_content_languages_in_progress,
      except: [:translations, :created_at, :updated_at]
    )
  end

  def translation_absent_content_languages
    ContentLanguageSerializer.serialize(
      model.translation_absent_content_languages,
      except: [:translations, :created_at, :updated_at]
    )
  end
end