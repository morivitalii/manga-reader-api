class Api::TyperDecorator < Api::ApplicationDecorator
  decorates_association :artist, with: Api::ArtistDecorator
end
