class Cleaner < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :artist_id

  belongs_to :artist

  has_many :resource_cleaners, dependent: :restrict_with_error
  has_many :chapters, through: :resource_cleaners, source: :resource, source_type: "Chapter"

  validates :artist, uniqueness: true
end
