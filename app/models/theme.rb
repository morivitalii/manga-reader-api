class Theme < ApplicationRecord
  # Tag association should not be changed because it will create mess with content tagging
  attr_readonly :tag_id

  belongs_to :tag

  has_many :resource_themes, dependent: :restrict_with_error
  has_many :titles, through: :resource_themes, source: :resource, source_type: "Title"

  validates :tag, uniqueness: true
end
