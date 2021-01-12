class Writer < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :artist_id

  belongs_to :artist

  has_many :titles, -> { where(resource_artists: { artist_type: ResourceArtist::WRITER }) }, through: :artist

  validates :artist, uniqueness: true
end
