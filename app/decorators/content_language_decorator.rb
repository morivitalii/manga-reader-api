class ContentLanguageDecorator < ApplicationDecorator
  decorates_association :locale, with: LocaleDecorator
end