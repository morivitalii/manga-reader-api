class Api::TagDecorator < Api::ApplicationDecorator
  include Api::Concerns::TranslationDecorator

  decorates_associations :translations, with: Api::TranslationDecorator
end