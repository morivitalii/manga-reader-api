class Api::ArtistFavoriteDecorator < Api::ApplicationDecorator
  decorates_association :user, with: Api::UserDecorator
end
