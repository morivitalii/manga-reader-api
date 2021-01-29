class ResourceTheme < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :theme_id, :resource_type, :resource_id

  belongs_to :theme
  belongs_to :resource, polymorphic: true

  validates :theme, presence: true, uniqueness: {scope: [:resource_type, :resource_id]}
end
