class Tag < ApplicationRecord
  include Translation
  include Search::Tag

  has_many :resource_tags, dependent: :restrict_with_error
  has_many :books, source: :resource, source_type: "Book", through: :resource_tags

  translates :title, :description

  validates :title, presence: true, length: { minimum: 1, maximum: 25 }
  validates :description, allow_blank: true, length: { minimum: 1, maximum: 1_000 }
  validates :key, presence: true, uniqueness: true
end
