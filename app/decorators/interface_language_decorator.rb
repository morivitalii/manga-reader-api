class InterfaceLanguageDecorator < ApplicationDecorator
  decorates_association :locale, with: LocaleDecorator
end