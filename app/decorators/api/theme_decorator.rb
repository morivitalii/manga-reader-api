class Api::ThemeDecorator < Api::ApplicationDecorator
  decorates_association :tag, with: Api::TagDecorator
end
