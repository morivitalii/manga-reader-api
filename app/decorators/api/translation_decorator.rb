# This class is intended to unify model translations decoration
class Api::TranslationDecorator < Api::ApplicationDecorator
  decorates_associations :content_language, with: Api::ContentLanguageDecorator
end