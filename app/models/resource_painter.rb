class ResourcePainter < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :painter_id, :resource_type, :resource_id

  belongs_to :painter
  belongs_to :resource, polymorphic: true

  validates :painter, presence: true, uniqueness: {scope: [:resource_type, :resource_id]}
end
