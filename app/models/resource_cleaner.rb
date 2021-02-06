class ResourceCleaner < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :cleaner_id, :resource_type, :resource_id

  belongs_to :cleaner
  belongs_to :resource, polymorphic: true

  validates :cleaner, presence: true, uniqueness: {scope: [:resource_type, :resource_id]}
  validates :resource, association_type: { in: ["Page"] }
end
