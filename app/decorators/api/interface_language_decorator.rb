class Api::InterfaceLanguageDecorator < ApplicationDecorator
  decorates_association :locale, with: Api::LocaleDecorator
end