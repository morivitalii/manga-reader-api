class Theme < ApplicationRecord
  # Tag association should not be changed because it will create mess with content tagging
  attr_readonly :tag_id

  belongs_to :tag

  has_many :titles, through: :tag

  validates :tag, uniqueness: true
end
