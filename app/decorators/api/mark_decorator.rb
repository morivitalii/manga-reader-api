class Api::MarkDecorator < Api::ApplicationDecorator
  decorates_association :tag, with: Api::TagDecorator
end