class Typer < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :artist_id

  belongs_to :artist

  has_many :resource_typers

  validates :artist, uniqueness: true
end
