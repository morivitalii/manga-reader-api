class UserAccessRight < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :user_id, :access_right_id

  # touch: true is required for cache invalidation
  belongs_to :user, touch: true

  belongs_to :access_right

  validates :user_id, uniqueness: { scope: [:access_right_id] }
end
