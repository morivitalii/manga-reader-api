class GroupUserAccessRight < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :group_access_right_id, :group_user_id

  belongs_to :group_access_right
  belongs_to :group_user

  validates :group_access_right_id, uniqueness: { scope: [:group_user_id] }
end
