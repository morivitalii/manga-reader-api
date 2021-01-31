class Api::CleanerDecorator < Api::ApplicationDecorator
  decorates_association :artist, with: Api::ArtistDecorator
end
