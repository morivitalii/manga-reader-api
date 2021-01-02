class Api::InterfaceLanguageDecorator < Api::ApplicationDecorator
  decorates_association :locale, with: Api::LocaleDecorator
end
