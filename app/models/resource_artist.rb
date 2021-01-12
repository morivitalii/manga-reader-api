class ResourceArtist < ApplicationRecord
  WRITER = "Writer"

  # This attributes should not be changed. Just because
  attr_readonly :artist_id, :artist_type, :resource_type, :resource_id

  belongs_to :artist
  belongs_to :resource, polymorphic: true

  validates :artist_type, presence: true, inclusion: { in: [WRITER] }
  validates :artist, presence: true, uniqueness: {scope: [:artist_type, :resource_type, :resource_id]}
end
