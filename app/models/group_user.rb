class GroupUser < ApplicationRecord
  include Translation

  # This attributes should not be changed. Just because
  attr_readonly :group_id, :user_id

  belongs_to :group, counter_cache: :users_count
  belongs_to :user

  validates :user_id, uniqueness: { scope: [:group_id] }
end
