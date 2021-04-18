class ResourceMark < ApplicationRecord
  # Allowed delegated types
  RESOURCE_TYPES = ["Title"]

  # This attributes should not be changed. Just because
  attr_readonly :mark_id, :resource_type, :resource_id

  belongs_to :mark

  delegated_type :resource, types: RESOURCE_TYPES

  validates :mark, presence: true, uniqueness: {scope: [:resource_type, :resource_id]}
  validates :resource, association_type: { in: RESOURCE_TYPES }
end
