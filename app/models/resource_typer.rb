class ResourceTyper < ApplicationRecord
  # Allowed delegated types
  RESOURCE_TYPES = ["Chapter"]

  # This attributes should not be changed. Just because
  attr_readonly :typer_id, :resource_type, :resource_id

  belongs_to :typer

  delegated_type :resource, types: RESOURCE_TYPES

  validates :typer, presence: true, uniqueness: {scope: [:resource_type, :resource_id]}
  validates :resource, association_type: { in: RESOURCE_TYPES }
end
