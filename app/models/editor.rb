class Editor < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :artist_id

  belongs_to :artist

  has_many :resource_editors, dependent: :restrict_with_error
  has_many :pages, through: :resource_editors, source: :resource, source_type: "Title"

  validates :artist, uniqueness: true
end
