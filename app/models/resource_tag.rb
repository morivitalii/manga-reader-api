class ResourceTag < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :tag_id, :resource_type, :resource_id

  belongs_to :tag
  belongs_to :resource, polymorphic: true

  validates :tag, presence: true, uniqueness: {scope: [:resource_type, :resource_id]}
end
