class ResourceEditor < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :editor_id, :resource_type, :resource_id

  belongs_to :editor
  belongs_to :resource, polymorphic: true

  validates :editor, presence: true, uniqueness: {scope: [:resource_type, :resource_id]}
  validates :resource, association_type: { in: ["Chapter"] }
end
