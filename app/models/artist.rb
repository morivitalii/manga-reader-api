class Artist < ApplicationRecord
  include Translation

  # This attributes should not be changed. Just because
  attr_readonly :user_id

  belongs_to :user, optional: true

  has_many :resource_artists, dependent: :restrict_with_error
  has_many :titles, through: :resource_artists, source: :resource, source_type: "Title"

  translates :name

  validates :name, presence: true, length: { maximum: 64 }
  validates :user, uniqueness: true
end
