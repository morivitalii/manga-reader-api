class ResourceFormat < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :format_id, :resource_type, :resource_id

  belongs_to :format
  belongs_to :resource, polymorphic: true

  validates :format, presence: true, uniqueness: {scope: [:resource_type, :resource_id]}
end
