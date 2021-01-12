class Api::WriterDecorator < Api::ApplicationDecorator
  decorates_association :artist, with: Api::ArtistDecorator
end
