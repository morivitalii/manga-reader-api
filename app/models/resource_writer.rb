class ResourceWriter < ApplicationRecord
  # Allowed delegated types
  RESOURCE_TYPES = ["Title", "Chapter"]

  # This attributes should not be changed. Just because
  attr_readonly :writer_id, :resource_type, :resource_id

  belongs_to :writer

  delegated_type :resource, types: RESOURCE_TYPES

  validates :writer, presence: true, uniqueness: {scope: [:resource_type, :resource_id]}
  validates :resource, association_type: { in: RESOURCE_TYPES }
end
