class Translator < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :artist_id

  belongs_to :artist

  has_many :resource_translators, dependent: :restrict_with_error
  has_many :chapters, through: :resource_translators, source: :resource, source_type: "Chapter"

  validates :artist, uniqueness: true
end
