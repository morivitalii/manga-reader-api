class ResourceGenre < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :genre_id, :resource_type, :resource_id

  belongs_to :genre
  belongs_to :resource, polymorphic: true

  validates :genre, presence: true, uniqueness: {scope: [:resource_type, :resource_id]}
  validates :resource, association_type: { in: ["Title"] }
end
