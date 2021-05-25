class Artist < ApplicationRecord
  include CacheInvalidation
  include Translation

  # This attributes should not be changed. Just because
  attr_readonly :user_id

  belongs_to :user, optional: true

  has_one :writer, dependent: :destroy
  has_one :painter, dependent: :destroy
  has_one :cleaner, dependent: :destroy
  has_one :translator, dependent: :destroy
  has_one :editor, dependent: :destroy
  has_one :typer, dependent: :destroy
  has_many :favorites, as: :resource, dependent: :destroy

  invalidate_association_cache :user
  invalidate_association_cache :writer
  invalidate_association_cache :painter
  invalidate_association_cache :cleaner
  invalidate_association_cache :translator
  invalidate_association_cache :editor
  invalidate_association_cache :typer

  translates :name

  validates :name, allow_blank: true, length: { minimum: 1, maximum: 64 }
  validates :user, uniqueness: true, allow_nil: true
end
