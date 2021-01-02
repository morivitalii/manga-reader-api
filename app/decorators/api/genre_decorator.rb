class Api::GenreDecorator < Api::ApplicationDecorator
  decorates_association :tag, with: Api::TagDecorator
end
