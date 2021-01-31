class Api::EditorDecorator < Api::ApplicationDecorator
  decorates_association :artist, with: Api::ArtistDecorator
end
