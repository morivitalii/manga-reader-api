class ResourceMark < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :mark_id, :resource_type, :resource_id

  belongs_to :mark
  belongs_to :resource, polymorphic: true

  validates :mark, presence: true, uniqueness: {scope: [:resource_type, :resource_id]}
  validates :resource, association_type: { in: ["Title"] }
end
