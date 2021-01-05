class GroupUser < ApplicationRecord
  include Translation

  # This attributes should not be changed. Just because
  attr_readonly :group_id, :user_id

  belongs_to :group
  belongs_to :user

  validates :user_id, uniqueness: { scope: [:group_id] }
end
