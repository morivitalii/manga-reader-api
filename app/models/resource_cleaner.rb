class ResourceCleaner < ApplicationRecord
  # Allowed delegated types
  RESOURCE_TYPES = ["Chapter"]

  # This attributes should not be changed. Just because
  attr_readonly :cleaner_id, :resource_type, :resource_id

  belongs_to :cleaner

  delegated_type :resource, types: RESOURCE_TYPES

  validates :cleaner, presence: true, uniqueness: {scope: [:resource_type, :resource_id]}
  validates :resource, association_type: { in: RESOURCE_TYPES }
end
