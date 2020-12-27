class Api::ContentLanguageDecorator < ApplicationDecorator
  decorates_association :locale, with: Api::LocaleDecorator
end