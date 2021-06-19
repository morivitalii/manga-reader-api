class Artist < ApplicationRecord
  include CacheInvalidation
  include Translation
  include Search::Artist

  belongs_to :user, optional: true

  has_many :resource_artists, dependent: :restrict_with_error
  has_many :favorites, as: :resource, dependent: :destroy

  invalidate_association_cache :user

  translates :name

  validates :name, allow_blank: true, length: { minimum: 1, maximum: 64 }
  validates :user, uniqueness: true, allow_nil: true
end
