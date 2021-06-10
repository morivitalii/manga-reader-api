class Artist < ApplicationRecord
  include CacheInvalidation
  include Translation

  belongs_to :user, optional: true

  has_many :favorites, as: :resource, dependent: :destroy

  invalidate_association_cache :user

  translates :name

  validates :name, allow_blank: true, length: { minimum: 1, maximum: 64 }
  validates :user, uniqueness: true, allow_nil: true
end
