class Painter < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :artist_id

  belongs_to :artist

  has_many :resource_painters
  has_many :titles, through: :resource_painters, source: :resource, source_type: "Title"

  validates :artist, uniqueness: true
end
