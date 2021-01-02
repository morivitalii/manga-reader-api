class ResourceTag < ApplicationRecord
  belongs_to :tag
  belongs_to :resource, polymorphic: true

  validates :tag, presence: true, uniqueness: {scope: [:resource_type, :resource_id]}
end
