class FormatDecorator < ApplicationDecorator
  decorates_association :tag, with: TagDecorator
end