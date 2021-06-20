class Api::VolumeDecorator < Api::ApplicationDecorator
  decorates_association :book, with: Api::BookDecorator
end
