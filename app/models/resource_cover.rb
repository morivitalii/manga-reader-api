class ResourceCover < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :cover_id, :resource_type, :resource_id

  belongs_to :cover
  belongs_to :resource, polymorphic: true

  validates :cover, presence: true, uniqueness: {scope: [:resource_type, :resource_id]}
  validates :resource, association_type: { in: ["Title"] }
end
