class ResourceWriter < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :writer_id, :resource_type, :resource_id

  belongs_to :writer
  belongs_to :resource, polymorphic: true

  validates :writer, presence: true, uniqueness: {scope: [:resource_type, :resource_id]}
end
