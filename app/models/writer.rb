class Writer < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :artist_id

  belongs_to :artist

  has_many :resource_writers
  has_many :titles, through: :resource_writers, source: :resource, source_type: "Title"

  validates :artist, uniqueness: true
end
