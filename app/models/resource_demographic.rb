class ResourceDemographic < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :demographic_id, :resource_type, :resource_id

  belongs_to :demographic
  belongs_to :resource, polymorphic: true

  validates :demographic, presence: true, uniqueness: {scope: [:resource_type, :resource_id]}
end
