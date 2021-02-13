class Api::CoverDecorator < Api::ApplicationDecorator
  decorates_association :content_language, with: Api::ContentLanguageDecorator
end
