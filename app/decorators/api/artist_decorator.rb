class Api::ArtistDecorator < Api::ApplicationDecorator
  decorates_association :user, with: Api::UserDecorator
end
