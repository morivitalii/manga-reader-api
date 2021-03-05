class Favorite < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :user_id, :resource_type, :resource_id, :created_at, :updated_at

  belongs_to :user, counter_cache: :favorites_count
  belongs_to :resource, polymorphic: true, counter_cache: :favorites_count

  validates :user, presence: true, uniqueness: {scope: [:resource_type, :resource_id]}
  validates :resource, presence: true, association_type: { in: ["Title", "Group", "Artist"] }
end
