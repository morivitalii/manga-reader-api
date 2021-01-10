class ResourceArtist < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :artist_id, :resource_type, :resource_id

  belongs_to :artist
  belongs_to :resource, polymorphic: true
end
