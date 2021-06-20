class Bookmark < ApplicationRecord
  # Allowed delegated types
  RESOURCE_TYPES = ["Book", "Chapter", "Page"]

  # This attributes should not be changed. Just because
  attr_readonly :user_id, :resource_type, :resource_id, :created_at, :updated_at

  belongs_to :user, counter_cache: :bookmarks_count

  delegated_type :resource, types: RESOURCE_TYPES, counter_cache: :bookmarks_count

  validates :user, presence: true, uniqueness: {scope: [:resource_type, :resource_id]}
  validates :resource, presence: true, association_type: { in: RESOURCE_TYPES }
end
