class UserAccessRight < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :user_id, :access_right_id

  belongs_to :user
  belongs_to :access_right

  validates :user_id, uniqueness: { scope: [:access_right_id] }
end
