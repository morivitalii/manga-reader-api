# Translatable models associations decoration
module Api::Concerns::TranslationDecorator
  extend ActiveSupport::Concern

  included do
    decorates_associations :translation_available_content_languages, with: Api::ContentLanguageDecorator
    decorates_associations :translation_completed_content_languages, with: Api::ContentLanguageDecorator
    decorates_associations :translation_content_languages_in_progress, with: Api::ContentLanguageDecorator
    decorates_associations :translation_absent_content_languages, with: Api::ContentLanguageDecorator
  end
end
