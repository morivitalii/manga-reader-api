class Api::ContentLanguageDecorator < Api::ApplicationDecorator
  decorates_association :locale, with: Api::LocaleDecorator
end
