class Api::ArtistDecorator < Api::ApplicationDecorator
  decorates_association :user, with: Api::UserDecorator
  decorates_association :favorite, with: Api::FavoriteDecorator
end
