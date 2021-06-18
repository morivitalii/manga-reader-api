class ResourceTag < ApplicationRecord
	# Allowed delegated types
	RESOURCE_TYPES = ["Title"]

	# This attributes should not be changed. Just because
	attr_readonly :tag_id, :tag_type, :resource_type, :resource_id

	belongs_to :tag

	delegated_type :resource, types: RESOURCE_TYPES

	enum tag_type: {
		demographic: 1,
		format: 2,
		genre: 3,
		mark: 4,
		theme: 5
	}

	validates :tag, presence: true, uniqueness: {scope: [:tag_type, :resource_type, :resource_id]}
	validates :resource, association_type: { in: RESOURCE_TYPES }
	validates :tag_type, presence: true
end
