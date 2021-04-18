class ResourcePainter < ApplicationRecord
  # Allowed delegated types
  RESOURCE_TYPES = ["Title", "Chapter"]

  # This attributes should not be changed. Just because
  attr_readonly :painter_id, :resource_type, :resource_id

  belongs_to :painter

  delegated_type :resource, types: RESOURCE_TYPES

  validates :painter, presence: true, uniqueness: {scope: [:resource_type, :resource_id]}
  validates :resource, association_type: { in: RESOURCE_TYPES }
end
