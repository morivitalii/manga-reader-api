class ResourceTyper < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :typer_id, :resource_type, :resource_id

  belongs_to :typer
  belongs_to :resource, polymorphic: true

  validates :typer, presence: true, uniqueness: {scope: [:resource_type, :resource_id]}
  validates :resource, association_type: { in: ["Chapter"] }
end
