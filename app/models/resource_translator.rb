class ResourceTranslator < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :translator_id, :resource_type, :resource_id

  belongs_to :translator
  belongs_to :resource, polymorphic: true

  validates :translator, presence: true, uniqueness: {scope: [:resource_type, :resource_id]}
  validates :resource, association_type: { in: ["Page"] }
end
