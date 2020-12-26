class DemographicDecorator < ApplicationDecorator
  decorates_association :tag, with: TagDecorator
end