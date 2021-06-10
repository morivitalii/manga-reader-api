class Api::ResourceArtistSerializer < Api::ApplicationSerializer
	serialize_association :artist, with: Api::ArtistSerializer

	def attributes
		{
			id: model.id,
			artist_id: model.artist_id,
			artist_type: model.artist_type,
			resource_id: model.resource_id,
			resource_type: model.resource_type,
			artist: artist
		}
	end
end
