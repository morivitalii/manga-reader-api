class ResourceArtist < ApplicationRecord
	# Allowed delegated types
	RESOURCE_TYPES = ["Title", "Chapter"]

	# This attributes should not be changed. Just because
	attr_readonly :artist_id, :artist_type, :resource_type, :resource_id

	belongs_to :artist

	delegated_type :resource, types: RESOURCE_TYPES

	enum artist_type: {
		writer: 1,
		painter: 2,
		cleaner: 3,
		translator: 4,
		editor: 5,
		typer: 6
	}

	validates :artist, presence: true, uniqueness: {scope: [:artist_type, :resource_type, :resource_id]}
	validates :resource, association_type: { in: RESOURCE_TYPES }
	validates :artist_type, presence: true
end
