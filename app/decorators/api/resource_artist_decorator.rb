class Api::ResourceArtistDecorator < Api::ApplicationDecorator
	decorates_association :artist, with: Api::ArtistDecorator
end
