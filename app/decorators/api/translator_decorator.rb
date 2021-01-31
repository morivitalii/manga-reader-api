class Api::TranslatorDecorator < Api::ApplicationDecorator
  decorates_association :artist, with: Api::ArtistDecorator
end
