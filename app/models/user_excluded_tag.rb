class UserExcludedTag < ApplicationRecord
  # This attributes should not be changed. Just because
  attr_readonly :user_id, :tag_id

  belongs_to :user, touch: true
  belongs_to :tag

  validates :user, uniqueness: {scope: [:tag_id]}
end
