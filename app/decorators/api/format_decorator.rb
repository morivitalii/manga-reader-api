class Api::FormatDecorator < Api::ApplicationDecorator
  decorates_association :tag, with: Api::TagDecorator
end
